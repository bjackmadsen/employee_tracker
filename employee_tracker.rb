require 'active_record'
require './lib/division'
require './lib/employee'
require './lib/project'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)

def welcome
  system 'clear'
  puts "Welcome to the Employee Tracker Program"
  menu
end

def menu
  choice = nil
  until choice == 'e'
    puts "Type '1' to add an Employee."
    puts "Type '2' to list employees."
    puts "Type '3' to add a Division."
    puts "Type '4' to list Divisions."
    puts "Type 'e' to exit."
    choice = gets.chomp
    case choice
    when '1'
      add_employee
    when '2'
      list_employees
    when '3'
      add_division
    when '4'
      list_divisions
    when 'e'
      puts "Good-bye!"
      sleep(1)
      system 'clear'
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
  puts "\n"
  choice = gets.chomp
  case choice
  when 'e'
    puts "here we go!"
  when 'd'
    delete_employee
  else
    puts "Sorry, that wasn't a valid option."
  end
end

def delete_employee
  puts "*** DELETE AN EMPLOYEE ***\n"
  puts "Please type the name of an Employee who you would like to delete:\n\n"
  Employee.all.each do |employee|
    puts employee.name
  end
  puts "\n"
  employee_name = gets.chomp
  deleted_employee = Employee.where({:name => employee_name}).first
  deleted_employee.destroy
  puts "\n#{employee_name} is no longer a Current Employee."
  sleep(1.5)
end

def add_division
  puts "*** ADD DIVISION ***\n\n"
  puts "Please add the name of an Division: "
  division_name = gets.chomp
  division = Division.new({:name => division_name})
  division.save
  puts "'#{division_name}' has been added to the list of current Divisions."
end

def list_divisions
  puts "*** CURRENT DIVISIONS ***\n"
  puts "Type 'd' to delete a division."
  puts "Type 'a' to add an employee to a division."
  puts "Type 'e' to return to the main menu.\n\n"
  divisions = Division.all
  divisions.each do |division|
    puts division.name
  end
  puts "\n"
  choice = gets.chomp
  case choice
  when 'a'
    employee_to_division
  when 'e'
    puts "Here we gooooo!"
  when 'd'
    delete_division
  else
    puts "Sorry, that wasn't a valid option."
  end
end

def delete_division
  puts "*** DELETE AN DIVISION ***\n"
  puts "Please type the name of an Division that you would like to delete:"
  Division.all.each do |division|
    puts division.name
  end
  division_name = gets.chomp
  deleted_division = Division.where({:name => division_name}).first
  deleted_division.destroy
  puts "\n\n#{division_name} is no longer a current Division."
  sleep(1.5)
end

# def employee_to_division
#   puts "*** ASSIGN EMPLOYEES TO DIVISIONS ***\n"
#   divisions = Division.all
#   divisions.each do |division|
#     puts division.name
#   end
#   puts "\n"
#   puts "To add employees type a division name."
#   division_name = gets.chomp
#   puts "\n add employee to #{division_name}.\n"
#   employees = Employee.all
#   employees.each do |employee|
#     puts employee.name
#   end
#   puts "\n type an employees name.\n"
#   employee_name = gets.chomp
#   Employee.

# end



welcome
