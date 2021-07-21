require_relative './tax2021_new/functions'
require_relative './tax2021_new/federal/medicare'
require_relative './tax2021_new/federal/social_security'
require_relative './tax2021_new/federal/income_tax_brackets'
require_relative './tax2021_new/state/income_tax_brackets'
require 'csv'

class Get2021TaxDataNew
  include Tax2021New::Functions
  include Tax2021New::Federal::Medicare
  include Tax2021New::Federal::SocialSecurity
  include Tax2021New::Federal
  include Tax2021New::State

  def get_2021_new_rates
    salaries = [50_000, 100_000, 150_000, 200_000, 250_000, 1_000_000]
    states = STATE_CODES.keys
    single = false
    married = true

    CSV.open('../data/federal_taxes_2021_new.csv', 'w') do |csv|
      salaries.each do |salary|
        single = get_annual_federal_tax(salary, single, 0)
        married = get_annual_federal_tax(salary, married, 0)
        csv << [salary.to_s, single.to_s,  married.to_s]
      end
    end

    CSV.open('../data/state_taxes_2021_new_old.csv', 'w') do |csv|
      states.each do |state|
        salaries.each do |salary|
          single_tax = get_annual_state_tax(state, salary, single)
          married_tax = get_annual_state_tax(state, salary, married)
          csv << [state, salary.to_s, single_tax.to_s,  married_tax.to_s]
        end
      end
    end

    CSV.open('../data/medicare_taxes_2021_new.csv', 'w') do |csv|
      salaries.each do |salary|
        single_medicare_tax = annual_medicare_tax(salary, single)
        married_medicare_tax = annual_medicare_tax(salary, married)
        csv << [salary.to_s, single_medicare_tax.to_s, married_medicare_tax.to_s]
      end
    end

    CSV.open('../data/social_security_taxes_2021_new.csv', 'w') do |csv|
      salaries.each do |salary|
        social_security_tax = annual_social_security_tax(salary)
        csv << [salary.to_s, social_security_tax.to_s]
      end
    end

    CSV.open('../data/all_taxes_2021_new.csv', 'w') do |csv|
      states.each do |state|
        salaries.each do |salary|
          single_tax = adjust_annual_salary_for_taxes_and_withholdings(state, salary, single, 0)
          married_tax = adjust_annual_salary_for_taxes_and_withholdings(state, salary, married, 0)
          csv << [state, salary.to_s, single_tax.to_s, married_tax.to_s]
        end
      end
    end
  end
end

g = Get2021TaxDataNew.new
g.get_2021_new_rates