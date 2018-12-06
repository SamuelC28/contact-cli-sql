# require_relative '../config/environment.rb'
# require_relative '../lib/contact.rb'

class Contact

    attr_accessor :name, :phone_number, :address, :email
    attr_reader :id

    # Initializing the attributes 
    def initialize(id=nil, name, phone_number, address, email)
        @id = id
        @name = name
        @phone_number = phone_number
        @address = address
        @email = email
    end
    
    # Creatting contact table 
    def self.create_table
      
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
    
    # dropping the all contacts from table contact. 
    def self.drop_table
      sql = "DROP TABLE IF EXISTS contacts"
      DB[:conn].execute(sql)
    end


   #dropping a contact / row from table contacts
   def self.drop_row id 
     sql = "DELETE FROM contacts WHERE id = ?"
      DB[:conn].execute(sql, id)
   end
   

   # inserting a new row into the database contact
   def save
     if self.id
       self.update
     else
       sql = <<-SQL
         INSERT INTO contacts (name, phone_number, address, email)
         VALUES (?, ?, ?, ?)
       SQL
       DB[:conn].execute(sql, name, phone_number, address, email)
       @id = DB[:conn].execute("SELECT last_insert_rowid() FROM contacts")[0][0]
     end
    end


    def self.create(name:, phone_number:, address:, email:)
        new_contact = new(name, phone_number, address, email)
        new_contact.save
        new_contact
    end


    # diplay all contacts in the table contacts
    def self.all
        sql = "SELECT * FROM contacts"
        DB[:conn].execute(sql)
    end


    def self.new_from_db row
      new(*row)
    end

    def self.find_by_name name
      sql = <<-SQL
        SELECT * FROM students
        WHERE name = ?
      SQL

      DB[:conn].execute(sql,name).map do |row|
        new_from_db(row)
      end.first
    end
    
    # updating the database row mapped to the Contact instance.
    def update
      sql = "UPDATE contacts SET name = ?, phone_number = ?, address = ?, email = ?, WHERE id = ?"
      DB[:conn].execute(sql, self.name, self.phone_number, self.address, self.email, self.id)
    end
end