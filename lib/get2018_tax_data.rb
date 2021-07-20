require_relative './tax2018/functions'
require_relative './tax2018/federal/medicare'
require_relative './tax2018/federal/social_security'
require_relative './tax2018/federal/income_tax_brackets'
require_relative './tax2018/state/income_tax_brackets'
require 'csv'

class Get2018TaxData
  include Tax2018::Functions
  include Tax2018::Federal::Medicare
  include Tax2018::Federal::SocialSecurity
  include Tax2018::Federal
  include Tax2018::State

  def calculate_2018_medicare_tax(annual_salary)
    annual_medicare_tax(annual_salary)
  end

  def calculate_2018_social_security_tax(annual_salary)
    annual_social_security_tax(annual_salary)
  end

  def calculate_2018_annual_withholding(annual_salary)
    annual_withholdings(50_000)
  end

  def calculate_2018_federal_tax(annual_salary, married)
    get_annual_federal_tax(annual_salary, married, 0)
  end

  def calculate_2018_state_tax(state, annual_salary, married)
    get_annual_state_tax(state, annual_salary, married)
  end

  def get_2018_rates
    salaries = [50_000, 100_000, 150_000, 200_000, 250_000, 1_000_000]
    states = STATE_CODES.keys
    single = false
    married = true

    CSV.open('../data/federal_taxes_2018.csv', 'w') do |csv|
      salaries.each do |salary|
        puts "Salary = " + salary.to_s
        single_tax = calculate_2018_federal_tax(salary, single)
        married_tax = calculate_2018_federal_tax(salary, married)
        csv << [salary.to_s, single_tax.to_s, married_tax.to_s]
      end
    end

    CSV.open('../data/state_taxes_2018.csv', 'w') do |csv|
      states.each do |state|
        salaries.each do |salary|
          puts "Salary = " + salary.to_s
          puts "State = " + state
          single_tax = calculate_2018_state_tax(state, salary, single)
          married_tax = calculate_2018_state_tax(state, salary, married)
          csv << [state, salary.to_s, single_tax.to_s, married_tax.to_s]
        end
      end
    end

    CSV.open('../data/medicare_taxes_2018.csv', 'w') do |csv|
      salaries.each do |salary|
        medicare_tax = calculate_2018_medicare_tax(salary)
        csv << [salary.to_s, medicare_tax.to_s]
      end
    end

    CSV.open('../data/social_security_taxes_2018.csv', 'w') do |csv|
      salaries.each do |salary|
        social_security_tax = calculate_2018_social_security_tax(salary)
        csv << [salary.to_s, social_security_tax.to_s]
      end
    end

    CSV.open('../data/all_taxes_2018.csv', 'w') do |csv|
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

g = Get2018TaxData.new
g.get_2018_rates