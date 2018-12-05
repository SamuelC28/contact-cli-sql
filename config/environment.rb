 require 'sqlite3'

 

 DB = {:conn => SQLite3::Database.new("db/contacts.db")}
 
puts DB

# require 'bundler/setup'

require 'bundler'
# Bundler.require

require_relative '../lib/contact.rb'

 require_relative '../lib/cli.rb'
require_relative '../lib/colors.rb'
