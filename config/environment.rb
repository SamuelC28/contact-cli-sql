 require 'sqlite3'
 DB = {:conn => SQLite3::Database.new("db/contacts.db")}
 puts DB
# require 'bundler/setup'

require 'bundler'
Bundler.require




puts "Environment is called"

 DB = {:conn => SQLite3::Database.new("db/contacts.db")}
 require_relative '../lib/contact.rb'

 require_relative '../lib/cli.rb'
require_relative '../lib/colors.rb'
