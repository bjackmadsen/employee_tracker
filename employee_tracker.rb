require 'active_record'
require './lib/division'
require './lib/employee'
require './lib/project'

database_configurations = YAML::(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)
