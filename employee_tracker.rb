require 'active_record'
require './lib/division'
require './lib/employee'
require './lib/project'

database_configurations = YAML::(File.open('./db/config.yml'))
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
      add
    when 'l'
      list
    when 'e'
      puts "Good-bye!"
    else
      puts "Sorry, that wasn't a valid option."
    end
  end
end

