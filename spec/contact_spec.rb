require "spec_helper"
require_relative '../config/environment.rb'

describe "Contact" do

  let(:josh) {Contact.new("Josuer", 39223309, "New York Cit, Street Ball", "josuer@gmail.com")}

  before(:each) do |example|
    unless example.metadata[:skip_before]

      DB[:conn].execute("DROP TABLE IF EXISTS contacts")
      sql =  <<-SQL
      CREATE TABLE IF NOT EXISTS contacts (
        id INTEGER PRIMARY KEY,
        name TEXT,
        phone_number INTEGER,
        address STRING,
        email STRING    
        )
        SQL
      DB[:conn].execute(sql)
    end
end

  describe "attributes" do
    it 'has a name, a phone number, an address, ana an email' do
      contact = Contact.new("Tiffany", 39223309, "New York Cit, Street Ball", "josuer@gmail.com")
      expect(contact.name).to eq("Tiffany")
      expect(contact.phone_number).to eq(39223309)
      expect(contact.address).to eq("New York Cit, Street Ball")
      expect(contact.email).to eq("josuer@gmail.com")
    end
end
    
    it 'has an id that defaults to `nil` on initialization' do
      contact = Contact.new("Tiffany", 39223309, "New York Cit, Street Ball", "josuer@gmail.com")
      expect(contact.id).to eq(nil)
    end

  describe ".create_table" do
    it 'creates the contacts table in the database', :skip_before do
      DB[:conn].execute("DROP TABLE IF EXISTS contacts")
      Contact.create_table
      table_check_sql = "SELECT tbl_name FROM sqlite_master WHERE type='table' AND tbl_name='contacts';"
      expect(DB[:conn].execute(table_check_sql)[0]).to eq(['contacts'])
    end
  end
  
  describe ".drop_table" do
    it 'drops the contacts table from the database' do
      Contact.drop_table
      table_check_sql = "SELECT tbl_name FROM sqlite_master WHERE type='table' AND tbl_name='contacts';"
      expect(DB[:conn].execute(table_check_sql)[0]).to eq(nil)
    end
  end

  describe ".drop_row id" do
    it 'drops one row from the contacts table from the database' do
      Contact.drop_row 'id'
      table_check_sql = "SELECT tbl_name FROM sqlite_master WHERE type='row' AND tbl_name='id';"
      expect(DB[:conn].execute(table_check_sql)[0]).to eq(nil)
    end
  end

  describe ".delete_only_data" do
    it 'deletes only data from the contacts table from the database' do
      Contact.delete_only_data
      table_check_sql = "SELECT * FROM contacts;"
      expect(DB[:conn].execute(table_check_sql)[0]).to eq(nil)
    end
  end

  describe "#save" do
    it 'saves an instance of the Contact class to the database and then sets the given contacts `id` attribute' do
      sarah = Contact.new("Sarah", 12345678, "Delams 45", "sarah@yahoo.com")
      sarah.save
      expect(DB[:conn].execute("SELECT * FROM contacts")).to eq([[1, "Sarah", 12345678, "Delams 45", "sarah@yahoo.com"]])
      expect(sarah.id).to eq(1)
    end

    it 'updates a record if called on an object that is already persisted' do
      jane = Contact.new("Jane Smith", 87654321, "Fermathe 11", "jane@omail.fr")
      jane.save
      jane_id = jane.id
      jane.name = "Jane Smith"
      jane.save
      jane_from_db = DB[:conn].execute("SELECT * FROM contacts WHERE id = ?", jane_id)
      expect(jane_from_db[0][1]).to eq("Jane Smith")
    end
  end

  describe ".create" do
    it 'creates a contact object with name, phone_number, address,  and email attributes' do
      Contact.create("Sally", 90785645, "Petion-ville", "sally@oal.com")
      expect(DB[:conn].execute("SELECT * FROM contacts")).to eq([[1, "Sally", 90785645, "Petion-ville", "sally@oal.com"]])
    end
  end

  describe ".all" do
    it 'displays all contacts in the table contacts' do
      Contact.all
      table_check_sql = "SELECT * FROM contacts;"
      expect(DB[:conn].execute(table_check_sql)[0]).to eq(nil)
    end
  end

<<<<<<< HEAD
=======

>>>>>>> c19e89529f2f5f9339e49c424a1922c423bb50b6
  describe '.new_from_db' do
    it 'creates an instance with corresponding attribute values' do
      row = [1, "Pat", 125555555, "Laboule 12", "pat@faceboo.com"]
      pat = Contact.new_from_db(row)

      expect(pat.id).to eq(row[0])
      expect(pat.name).to eq(row[1])
      expect(pat.phone_number).to eq(row[2])
      expect(pat.address).to eq(row[3])
      expect(pat.email).to eq(row[4])
    end
  end

  describe '.find_by_name' do
    it 'returns an instance of contact that matches the name from the DB' do
    josuer = Contact.new("Josuer", 39223309, "New York Cit, Street Ball", "josuer@gmail.com")
    josuer.save
    josuer_id = josuer.id
    josuer_from_db = Contact.find_by_name("Josuer")
    expect(josuer_from_db.name).to eq("Josuer")
    expect(josuer_from_db.phone_number).to eq(39223309)
    expect(josuer_from_db.address).to eq("New York Cit, Street Ball")
    expect(josuer_from_db.email).to eq("josuer@gmail.com")
    expect(josuer_from_db.id).to eq(josuer_id) 
    end
  end

  describe '#update' do
    it 'updates the record associated with a given instance' do
      josuer = Contact.new("Josuer", 39223309, "New York Cit, Street Ball", "josuer@gmail.com")
      josuer.save
      josuer.name = "Josuer Jr."
      josuer.update
      josuer_jr = Contact.find_by_name("Josuer Jr.")
      expect(josuer_jr.id).to eq(josuer.id)
    end
  end
<<<<<<< HEAD

=======
>>>>>>> c19e89529f2f5f9339e49c424a1922c423bb50b6
end