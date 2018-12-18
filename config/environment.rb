require 'sqlite3'
DB = {:conn => SQLite3::Database.new("db/contacts.db")}

# require 'bundler'
# Bundler.require
# require "spec_helper.rb"
# require "contact_spec.rb"
require_relative '../lib/contact.rb'

require_relative '../lib/menu.rb'
require_relative '../lib/cli.rb'
require_relative '../lib/repeatedmessages.rb'
require_relative '../lib/colors.rb'
require_relative '../lib/table.rb'

All_messages.new.welcome_msg


