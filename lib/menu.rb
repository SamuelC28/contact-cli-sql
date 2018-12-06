 require_relative '../config/environment.rb'

class Menu
    def welcome_msg
        # clear_screen
        system("clear")
        sleep(1)
        puts "=" * 90
        puts "                               Welcome To Our Contact Program!".green
        puts "=" * 90
        puts ""
        show_option
    end
        # main_Menu
        # choose_option
    

    # def main_Menu
    #     puts "What would you like to do?\n"
    #     puts "1: Add a new contact".green
    #     puts "2: Display contacts".green
    #     puts "3: Modify contact".green
    #     puts "4: Delete contact".green
    #     puts "q: To Exit The Program".green
    # end
    
    #Add contact in contacts table (OPTION 1)
    def add_contact
        system('clear')
        puts "Create A New Contact!\n"

        puts "Enter Fullname:".green
        name =gets.chomp
        if name.empty? 
            puts "Name is mandatory.\nYou must enter a name to continue!".red
            sleep(2)
            puts "Enter a Valid name"
            name = gets.chomp
        end
      
        puts "Enter Address:".green
        address = gets.chomp
        if address.empty? 
            puts "Address is mandatory.\nYou must enter a Address to continue!".red
            sleep(2)
            puts "Enter a Valid Address"
            address = gets.chomp 
        end
       
        puts "Enter E-mail:".green
        email = gets.chomp
        if email.empty? 
            puts "Email is mandatory.\nYou must enter a Email to continue!".red
            sleep(2)
            puts "Enter a Valid Email"
            email = gets.chomp
        end
       
        puts "Enter Phone Number:".green
        phone_number = gets.chomp
        if phone_number.empty? 
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
    #    sleep(4)
    #    system('clear') 
    #    main_Menu
       show_option()
    end 

    #diplay all contacts added in contacts table (OPTION 2)
     def display_all_contacts 
        Contact.all.each do |contact|
           puts  "#{contact.join ", "} "
        end        
    end     
    
    # delete a choosen contact from contact table (OPTION 3)
    def delete_a_contact 
        display_all_contacts 

        puts "\n Enter the id contact you want to delete!".green
        input_id= gets.chomp.to_i
        Contact.drop_row input_id if input_id == Contact.all[0][0]

        puts "Contact id #{input_id} has been deleted!\nBelow are your contact now:\n".cyan
        display_all_contacts 

        
        # main_Menu
        show_option
    end

    #delete all contact from database (OPTION 4)
    def delete_all_contacts
        Contact.drop_table
        puts "Your contact has been emptied!"
    end

    #clear the screen
    # def clear_screen
    #     system('clear')
    #     main_Menu
    #     choose_option
    # end 

# def modify_contact(all_contacts
    


# def exit_contacts(all_contacts)
#     puts "Are you sure you want to exit contacts?"
#     puts "enter 'y' if yes or 'n' if no"
#     input = gets.chomp
#     if input == "n" || input == "N"
#         display_menu
#        choose_option(all_contacts)
#     else
#         at_exit do 
#             exit
#         end 
#         puts "bye!!!"
#     end 
# end
    
    def show_option
        puts "What would you like to do?\n"
            puts "1: Add a new contact".green
            puts "2: Display contacts".green
            puts "3: Modify contact".green
            puts "4: Delete contact".green
            puts "q: To Exit The Program".green

        option = gets.chomp
        case option
        when "1"
            add_contact
        when "2"
            display_all_contacts 
         when "3"
            delete_a_contact
        when "4"
            delete_all_contacts
        when "5"
            modify_a_contact
        when
            exit_contacts
            save()
        else
            puts "Entry #{option} is not exist".
    #    return main_Menu
        show_option
        end     
    end
 end
# Menu.new



    