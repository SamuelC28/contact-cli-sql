require 'sqlite3'
require_relative '../lib/contact.rb'
require_relative '../lib/CLI.rb'
require_relative '../lib/colors.rb'

DB = {:conn => SQLite3::Database.new("db/contacts.db")}