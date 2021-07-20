require_relative '../util/state'

module Tax2021New
  module Functions
    include Util::State

    def adjust_annual_salary_for_taxes_and_withholdings(state, annual_income, married, dependents)
      return 0 if annual_income == 0
      # if get_annual_state_tax is nil (because the state is not in the 50 + DC), let's play it safe
      # and try to find all the money
      imputed_annual_state_tax = get_annual_state_tax(state, annual_income, married) || 0

      total_taxes_and_withholdings = get_annual_federal_tax(annual_income, married, dependents) +
        imputed_annual_state_tax +
        annual_withholdings(annual_income, married)

      annual_income - total_taxes_and_withholdings
    end

    def get_annual_federal_tax(annual_income, married, dependents)
      if married
        standard_deduction = 25_100
      else
        standard_deduction = 12_550
      end
      deducted_annual_income = annual_income - standard_deduction

      if married
        brackets = Tax2021New::Federal::INCOME_TAX_BRACKETS.fetch(:MARRIED)
      else
        brackets = Tax2021New::Federal::INCOME_TAX_BRACKETS.fetch(:SINGLE)
      end

      annual_tax = brackets.inject(0) do |tax_amount, bracket|
        # Comparison may be against Float::INFINITY and requires `annual_income` NOT to be a BigDecimal
        # e.g. `1.to_d < Float::INFINITY` raises FloatDomainError: Infinity
        # TODO: Issue #7856 explains the larger refactor that is necessary here
        case
        when deducted_annual_income.to_f <= bracket[0]
          tax_amount
        when deducted_annual_income.to_f <= bracket[1] && deducted_annual_income > bracket[0]
          tax_amount + bracket[2] * (deducted_annual_income - bracket[0])
        when deducted_annual_income.to_f > bracket[1]
          tax_amount + bracket[2] * (bracket[1] - bracket[0])
        end
      end

      annual_tax
    end

    def get_annual_state_tax(state_name, annual_income, married)
      state_code = state_code(state_name)

      if Tax2021New::State::INCOME_TAX_BRACKETS.keys.include?(state_code.to_sym)
        if married
          brackets = Tax2021New::State::INCOME_TAX_BRACKETS.fetch(state_code.to_sym).fetch(:MARRIED)
          standard_deduction = Tax2021New::State::INCOME_TAX_BRACKETS.fetch(state_code.to_sym).fetch(:MARRIED_DEDUCTION)
        else
          brackets = Tax2021New::State::INCOME_TAX_BRACKETS.fetch(state_code.to_sym).fetch(:SINGLE)
          standard_deduction = Tax2021New::State::INCOME_TAX_BRACKETS.fetch(state_code.to_sym).fetch(:SINGLE_DEDUCTION)
        end
      else
        return
      end

      annual_income -= standard_deduction

      annual_tax = brackets.inject(0) do |tax_amount, bracket|
        # Comparison may be against Float::INFINITY and requires `annual_income` NOT to be a BigDecimal
        # e.g. `1.to_d < Float::INFINITY` raises FloatDomainError: Infinity
        # TODO: Issue #7856 explains the larger refactor that is necessary here
        case
        when annual_income.to_f <= bracket[0]
          tax_amount
        when annual_income.to_f <= bracket[1] && annual_income > bracket[0]
          tax_amount + bracket[2] * (annual_income - bracket[0])
        when annual_income.to_f > bracket[1]
          tax_amount + bracket[2] * (bracket[1] - bracket[0])
        end
      end

      annual_tax
    end

    def annual_withholdings(annual_salary, married)
      annual_social_security_tax(annual_salary) + annual_medicare_tax(annual_salary, married)
    end

    def annual_social_security_tax(annual_salary)
      [annual_salary * Tax2021New::Federal::SocialSecurity::TAX_RATE,
       Tax2021New::Federal::SocialSecurity::SALARY_CAP * Tax2021New::Federal::SocialSecurity::TAX_RATE].min
    end

    def annual_medicare_tax(annual_salary, married)
      top_rate_cap = married ? Tax2021New::Federal::Medicare::MARRIED_TOP_RATE_CAP : Tax2021New::Federal::Medicare::SINGLE_TOP_RATE_CAP
      top_rate = Tax2021New::Federal::Medicare::TOP_RATE
      lower_rate = Tax2021New::Federal::Medicare::LOWER_RATE
      if annual_salary < top_rate_cap
        medicare_tax = annual_salary * top_rate
      else
        medicare_tax = (top_rate_cap * top_rate) + ((annual_salary - top_rate_cap) * lower_rate)
      end
      medicare_tax
    end
  end
end