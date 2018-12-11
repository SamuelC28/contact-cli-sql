
class Contact

    attr_accessor :name, :phone_number, :address, :email
    attr_reader :id

    # Initializing the attributes 
    def initialize(id=nil, name, phone_number, address, email)
      @email, @phone_number, @address, @name, @id = email, phone_number, address, name, id
    end
    
    # Creates a contacts table 
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
      DB[:conn].execute(sql,id)
   end

   #deleting all data in contacts table, but not the table
   def self.delete_only_data
      sql = "DELETE FROM contacts"
      DB[:conn].execute(sql)
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

    #creates new contact and save them
    def self.create(name:, phone_number:, address:, email:)
        new_contact = new(name, phone_number, address, email)
        new_contact.save
        new_contact
    end


    # displays all contacts in the table contacts
    def self.all
        sql = "SELECT * FROM contacts"
        DB[:conn].execute(sql)
    end

    # displays all contacts in the table contacts in alpha order by
    def self.alphabetic_order
      sql = "SELECT * FROM contacts ORDER BY name ASC"
      DB[:conn].execute(sql)
    end

    def self.new_from_db row
      new(*row)
    end

    def self.find_by_name name
      sql = <<-SQL
        SELECT * FROM contacts
        WHERE name = ?
      SQL

      DB[:conn].execute(sql,name).map do |row|
        new_from_db(row)
      end.first
    end
    
    # updating the database row mapped to the Contact instance.
    def update
      sql = "UPDATE contacts SET name = ?, phone_number = ?, address = ?, email = ? WHERE id = ?"
      DB[:conn].execute(sql, name, phone_number, address, email, id)
    end
    
    #alter phone number only
    def self.update_phone_number id, phone_number
      sql ="UPDATE contacts SET phone_number = ? WHERE id = ?"
       DB[:conn].execute(sql,phone_number,id)
    end
    
    #alter name only
    def self.update_name id, name
      sql ="UPDATE contacts SET name = ? WHERE id = ?"
       DB[:conn].execute(sql,name,id)
    end

    #alter email only
    def self.update_email id, email
      sql ="UPDATE contacts SET email = ? WHERE id = ?"
       DB[:conn].execute(sql,email,id)
    end

    #alter address only
    def self.update_address id, address
      sql ="UPDATE contacts SET address = ? WHERE id = ?"
       DB[:conn].execute(sql,address,id)
    end
end