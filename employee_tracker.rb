require 'active_record'
require './lib/division'
require './lib/employee'
require './lib/project'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)

def welcome
  puts "Welcome to the Employee Tracker Program"
  menu
end

def menu
  choice = nil
  until choice == 'e'
    puts "Type 'a' to add an employee, and 'l' to list employees."
    puts "Type 'e' to exit."
    choice = gets.chomp
    case choice
    when 'a'
      add_employee
    when 'l'
      list_employees
    when 'e'
      puts "Good-bye!"
    else
      puts "Sorry, that wasn't a valid option."
    end
  end
end

def add_employee
  puts "*** ADD EMPLOYEE ***\n\n"
  puts "Please add the name of an Employee: "
  employee_name = gets.chomp
  employee = Employee.new({:name => employee_name})
  employee.save
  puts "'#{employee_name}' has been added to the list of current Employees."
end

def list_employees
  puts "*** CURRENT EMPLOYEES ***\n"
  puts "Type 'd' to delete an employee."
  puts "Type 'e' to return to the main menu.\n\n"
  employees = Employee.all
  employees.each do |employee|
    puts employee.name
  end
  choice = gets.chomp
  case choice
  when 'e'
    menu
  when 'd'
    delete_employee
  else
    puts "Sorry, that wasn't a valid option."
  end
end

welcome
