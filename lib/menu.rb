 require_relative '../config/environment.rb'

class Menu
    #welcome message
    def welcome_msg
        system("clear")
        sleep(1)
        puts "=" * 90
        puts "                               Welcome To Our Contact Program!".green
        puts "=" * 90
        puts ""
        show_option
    end
    
    #Add contact in contacts table (OPTION 1)
    def add_contact
        system('clear')
        puts "Create A New Contact!\n"

        puts "Enter Fullname:".green
        name =gets.chomp
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
         Contact.create(name:name, phone_number:phone_number, address:address, email:email) 
        else
            Contact.create_table
            Contact.create(name:name, phone_number:phone_number, address:address, email:email) 
        end
        
       puts "Contact Created successfull!".cyan
       sleep(3)
    #    system('clear') 
    #    main_Menu
    end 

    #diplay all contacts added in contacts table (OPTION 2a)
     def display_all_contacts_without_order
        system("clear")
        Contact.all.each do |contact|
           puts "hello"
        #    puts "#{contact.join ", "}\n"
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

        input_id= gets.chomp.to_i
        puts "jjjjjjj"
        Contact.drop_row input_id if input_id == Contact.all[0][0]
        puts "Contact id #{input_id} has been deleted!\nBelow are your contact now:\n".cyan
        display_all_contacts_without_order
    end

    # delete all the rows in Contact table
    def delete_all_data_from_table
        display_all_contacts_without_order
        Contact.delete_only_data
        puts "Your contacts has been emptied from the database!"
        sleep(3)
        system('clear')
        show_option
    end


    #delete all contact from database (OPTION 4)
    def delete_all_contacts
        Contact.drop_table
        puts "Your contact has been emptied!"
        sleep(3)
        system('clear')
        show_option
    end

    #clear the screen
    # def clear_screen
    #     system('clear')
    #     main_Menu
    #     choose_option
    # end 

   # modifies a contact
    def modify_a_contact
        puts "Please, Enter the contact id you want to modify!".green
        modify_id =  gets.chomp.to_i
        Contact.all.each do |contact_column|
            if modify_id == contact_column.first
                puts "Re-enter/Enter A New Name".green
                name = gets.chomp.capitalize.magenta
                puts "Re-enter/Enter A Email".green
                email = gets.chomp.downcase.magenta
                puts "Re-enter/EnterEnter A New Phone Number".green
                phone_number =gets.chomp.magenta
                puts "Re-enter/Enter A New Address".green 
                address = gets.chomp.capitalize.magenta
                v = Contact.new contact_column.first, name, phone_number, address, email
                v.update
                puts "Contact id #{modify_id} has been modified!\nBelow is your modified contact:\n".cyan
                puts "\nYour new contact is:\n#{v.name}, #{v.phone_number}, #{v.address}, #{v.email}".green
            end
        end
    end

    #find a contact by typing a name

    def find_a_contact
        puts "Enter the name you want to look for:".green
        input_name = gets.chomp

        Contact.all.each do |contact_column|
            puts "#{contact_column[1]}, #{contact_column[2]}, #{contact_column[3]}, #{contact_column[4]}" if input_name == contact_column[1]
        end
    end
    
    # Exit program
    def exit_contacts
        puts "Are you sure you want to exit contacts?".cyan
        puts "enter 'y' if yes or 'n' if no".green
        input = gets.chomp
        if input == "n" || input == "N"
            show_option
        else
            system('clear')
            puts "Bye!!!"
            exit
        end 
    end

    #return to menu
    def back_to_menu
        puts "press 'b' key to go back to menu!\n Or 'q' to exit program!".green
        press_key = gets.strip
        if press_key == "b"
            show_option
        elsif press_key == "q"
            system('clear')
            exit_contacts
        else
            puts "Invalid key".red
            puts "press 'b' key to go back to menu!\n Or 'q' to exit program!".green
            return back_to_menu
        end
    end

    
    def show_option
        puts "What would you like to do?\n"
        puts "1: Add a new contact".green
        puts "2: Display contacts".green
        puts "3: Delete A contact".green
        puts "4: Crash Your App".green
        puts "5: Modify A contact".green
        puts "6: Type A Name to Find A Contact!".green 
        puts "7: delete All Your Contacts!".green
        
        puts "q: To Exit The Program".green

        option = gets.chomp.to_s
        case option
        when "1"
            add_contact
            system('clear')
            show_option
        when "2"
            display_all_contacts_without_order
            # puts "enter 'A'for alphabetic order.\nOr 'B' for any Order!"
            # diplay_option = gets.chomp
            # if diplay_option == "A"
            # display_all_contacts_alpha_order
            # else
            # display_all_contacts_without_order
            # end
            # display_all_contacts 
            back_to_menu
            # sleep(3)
            # system('clear')
            show_option 
            # return show_option if Contact.all.empty?
        when "3"
            delete_a_contact
        when "4"
            delete_all_contacts
        when "5"
            modify_a_contact
        when "6"
            find_a_contact
        when "7"
            delete_all_data_from_table
        when "q"
            exit_contacts
        else
            puts "Entry '#{option}' Is Not An Option!".red
            sleep(3)
            system('clear')
            show_option
        end     
    end
 end



    