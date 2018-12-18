class Cli
    #welcome message
    
    #Add contact in contacts table (OPTION 1)
    def add_contact
        system('clear')
        puts "Create A New Contact!\n"

        puts "Enter Fullname:".green
        name = gets.chomp
        until !name.empty? 
            puts "Name is mandatory.\nYou must enter a name to continue!".red
            sleep(2)
            puts "Enter a Valid name"
            name = gets.chomp
        end

        puts "Enter Address:".green
        address = gets.chomp
        until !address.empty?
            puts "Address is mandatory.\nYou must enter a Address to continue!".red
            sleep(2)
            puts "Enter a Valid Address"
            address = gets.chomp 
        end

        puts "Enter E-mail:".green
        email = gets.chomp
        until !email.empty? 
            puts "Email is mandatory.\nYou must enter a Email to continue!".red
            sleep(2)
            puts "Enter a Valid Email"
            email = gets.chomp
        end
    
       
        puts "Enter Phone Number:".green
        phone_number = gets.chomp
        until !phone_number.empty? 
            puts "Phone Number is mandatory.\nYou must enter a Phone Number to continue!".red
            sleep(2)
            puts "Enter a Valid Phone Number"
            phone_number = gets.chomp
        end

        if Contact.create_table == true
            Contact.create(name, phone_number, address, email) 
        else
            Contact.create_table
            Contact.create(name, phone_number, address, email) 
        end
       
       puts "Contact Created successfull!".cyan
       All_messages.new.pause_and_clear_screen 
    end 
   
    #diplay all contacts added in contacts table (OPTION 2a)
     def display_all_contacts_without_order
        sleep(1)
        system("clear") 
        puts "|  ID    |    FULL NAME    |   PHONE NUMBER   |        ADDRESS        |         EMAIL         |".cyan
        puts "-" *95
        Contact.all.each do |contact|
           puts "|   #{contact.join "    |    "}  |\n"
           puts "-" *95
        end
    end     
    
    #diplay all contacts added in contacts table (OPTION 2b)
    # def display_all_contacts_alpha_order 
    #     system("clear")
    #     Contact.alphabetic_order.each do |contact|
    #        puts  "#{contact.join ", "}\n"
    #     end 
    # end     
    
    # delete a choosen contact from contact table (OPTION 3)
    def delete_a_contact 
        display_all_contacts_without_order
        puts "\n Enter the id contact you want to delete!".green
        input_id = gets.chomp.to_i
        id_found = false
        
        Contact.all.each do |contact_column|    
            if contact_column[0] == input_id
                Contact.drop_row input_id 
                id_found = true
            end
            puts "Contact id #{input_id} has been deleted!\nBelow are your contact now!\n".cyan
            All_messages.new.pause_and_clear_screen
            back_to_menu_or_exit
        end

        until id_found == true
            puts "'#{input_id}' is not in your contact!\n".red 
           return delete_a_contact
         end
        
    end


    #delete both table and all contacts (OPTION 4)
    def crash_app
        puts "Are you really sure you want crash you program?\nwarning: if you choose 'yes', your app will crash!\n".upcase.red
        puts "Enter 'yes' or 'no'.".green
        desicive_input = gets.chomp
        if desicive_input =='y' || desicive_input =='yes' || desicive_input == 'YES'
             Contact.drop_table
             puts "Your App Has Been Crashed!".cyan
             All_messages.new.pause_and_clear_screen
             exit
        else
            Menu.new.show_option
        end
    end


   # modifies a contact (OPTION 3a)
    def modify_a_contact
        display_all_contacts_without_order
        puts "Please, Enter the contact id you want to modify!".green
        modify_id =  gets.to_i
        id_exist = false

        Contact.all.each do |contact_column|
            if modify_id == contact_column.first
                
                puts "Re-enter/Enter A New Name".green
                name = gets.chomp.capitalize
                until !name.empty? 
                    All_messages.new.message_restriction
                    name = gets.chomp
                end
                
                puts "Re-enter/Enter A Email".green
                email = gets.chomp.downcase
                until !email.empty? 
                    All_messages.new.message_restriction
                    email = gets.chomp
                end
               
                puts "Re-enter/EnterEnter A New Phone Number".green
                phone_number = gets.chomp
                until !phone_number.empty? 
                    All_messages.new.message_restriction
                    phone_number = gets.chomp
                end
                
                puts "Re-enter/Enter A New Address".green 
                address = gets.chomp.capitalize
                until !address.empty? 
                    All_messages.new.message_restriction
                    address = gets.chomp
                end
                
                v = Contact.new contact_column.first, name, phone_number, address, email
                v.update
                system('clear')
                puts "Contact id #{modify_id} has been modified!\nBelow is your modified contact:1".cyan
                puts "\nYour new contact is:\n\Full Name: " +"#{v.name}".magenta + ", Phone: " + "#{v.phone_number}".magenta + ", Address: " + "#{v.address}".magenta+ ", Email: " +"#{v.email}".magenta
                id_exist = true
            end
        end
        until id_exist == true
           puts "'#{modify_id}' is not in your contact!\n".red 
           modify_a_contact
        end
        Menu.new.show_option
    end

     #modify only phone number
     def alter_phone_number
        display_all_contacts_without_order
        puts "Please, Enter the contact id you want to modify!".green
        input_id =  gets.to_i
        id_exist = false

        Contact.all.each do |contact_column|
            if input_id == contact_column[0]
                puts "Enter the new phone Number."
                new_phone_number = gets.chomp.to_i
                Contact.update_phone_number input_id, new_phone_number
                All_messages.new.pause_and_clear_screen
                puts "You Have Successfully Updated #{contact_column[1]}'s phone Number!".cyan
                id_exist = true
            end
        end
        until id_exist == true
            puts "'#{input_id}' is not in your contact!\n".red 
            alter_phone_number
         end
        Menu.new.show_option
    end
   
    #Modify only email address
    def alter_email
        display_all_contacts_without_order
        puts "Please, Enter the contact id you want to modify!".green
        input_id =  gets.to_i
        id_exist = false

        Contact.all.each do |contact_column|
            if input_id == contact_column[0]
                puts "Enter the new email.".green
                new_email = gets.chomp
                Contact.update_email input_id, new_email
                All_messages.new.pause_and_clear_screen
                puts "You Have Succesffully Updated #{contact_column[1]}'s email.".cyan
                id_exist = true
            end
        end
        until id_exist == true
            puts "'#{input_id}' is not in your contact!\n".red 
            All_messages.new.pause_and_clear_screen
            alter_email
        end
        Menu.new.show_option
    end

      #Modify only name
    def alter_name
        system('clear')
        display_all_contacts_without_order
        puts "Enter the id contact you want to modify".green
        input_id = gets.chomp.to_i
        id_exist = false

        Contact.all.each do |contact_column|
            if input_id == contact_column[0]
                puts "Enter the new name:"
                new_name = gets.chomp
                Contact.update_name input_id, new_name
                All_messages.new.pause_and_clear_screen
                puts "You Have Succesffully Updated id #{contact_column[0]} In Your Contact.".cyan
                id_exist = true
            end
        end
        until id_exist == true
            puts "'#{input_id}' is not in your contact!\n".red 
            All_messages.new.pause_and_clear_screen
           alter_name
        end
        Menu.new.show_option
    end

    #modify only address
    def alter_address
        display_all_contacts_without_order
        puts "Enter the id contact you want to modidy".green
        input_id = gets.chomp.to_i
        id_exist = false

        Contact.all.each do |contact_column|
            if input_id == contact_column[0]
                puts "Enter the new address."
                new_address = gets.chomp
                Contact.update_phone_number input_id, new_address
                All_messages.new.pause_and_clear_screen
                puts "You Have Succesffully Updated #{contact_column[1]}'s address.".cyan
                id_exist = true
            end
        end
        until id_exist == true
            puts "'#{input_id}' is not in your contact!\n".red 
            alter_address
        end
        Menu.new.show_option
    end

    #find a contact by typing a name (OPTION 6)
    def find_a_contact
        display_all_contacts_without_order
        puts "\nEnter the name you want to look for:".green
        input_name = gets.chomp
        is_found = false

        Contact.all.each do |contact_column|
            if input_name == contact_column[1]
                puts "Full Name: #{contact_column[1]}, Phone Number: #{contact_column[2]}, Address: #{contact_column[3]}, Email: #{contact_column[4]}\n\n"
                Cli.new.back_to_menu_or_exit
                is_found = true
            end 
        end
        if !is_found
            puts "'#{input_name}' is not in your contact list!\n".red
            sleep(2)
            find_a_contact
        end
    end

    # delete all the rows in Contact table(OPTION 7)
    def delete_all_data_from_table
        puts "Are you really sure you want to dump your entire contacts?\n".upcase.red
        puts "Enter 'yes' or 'no'.".green
        decive_input = gets.chomp
        if decive_input =='y' || decive_input =='yes' || decive_input == 'YES'
            Contact.delete_only_data
            puts "Your contacts has been emptied from the database!".bold.blue.blink
            sleep(2)
            system('clear')
            Menu.new.show_option
        else
            Menu.new.show_option
        end
    end

    # Exit program
    def exit_contacts
        All_messages.new.pause_and_clear_screen
        puts "Are you sure you want to exit contacts?".cyan
        puts "Enter 'y' if yes or 'n' if no".green
        input = gets.chomp
        if input == "n" || input == "no" || input == "N"
            system('clear')
            Menu.new.show_option
        else
            system('clear')
            puts "Bye!!!".bold
            exit
            All_messages.new.pause_and_clear_screen
        end 
    end

    #return to menu
    def back_to_menu_or_exit
        puts "\nPress 'b' key to go back to menu!\n Or 'q' to exit program!".bold.green
        press_key = gets.strip
        if press_key == "b"
              system ('clear')
            Menu.new.show_option
        elsif press_key == "q"
            system('clear')
            exit_contacts
        else
            puts "Invalid key".red
            puts "Press 'b' key to go back to menu!\n Or 'q' to exit program!".bold.green
            return back_to_menu_or_exit
        end
    end
end

 

 