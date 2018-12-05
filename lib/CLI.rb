# require_relative '../config/environment.rb'
# require_relative 'contact.rb'

class ContactCli
    def welcome_msg
        system('clear')
        sleep(1)
        puts "Welcome To Our Contact Program!\n".green
        
        menu
        choose_option
    end

    def menu
        puts "Choose An Option Below:".green
        puts "Please, Choose an Option".green
        puts "Enter 1 To Add A Contact".green
        puts "Enter 2 To Display All Contact".green
        puts "Enter 3 To Modify A Contact".green
        puts "Enter 4 To Delete A Contact".green
        puts "Enter 5 To Delete All Contacts".green
        puts "Enter 6 To Exit The Program".green
    end
    
    def add_contact
        system('clear')
        puts "Create A New Contact!\n"

        puts "Enter Fullname:".green
        name =gets.chomp
        # contact["Fullname"] = fullname

        puts "Enter Address:".green
        address = gets.chomp
        # contact["Address"] = address

        puts "Enter E-mail:".green
        email = gets.chomp
        # contact["Email"] = email

        puts "Enter Phone Number:".green
        phone_number = gets.chomp
        # contact["Phone Number"] = phone_number

       v= Contact.create(name:name, phone_number:phone_number, address:address, email:email)
       puts v.name
    end 

    def display_contacts
        # puts "Full Name | Phone Number | Birthday | Address | E-mail"
        # puts"........................................................................"
        add_contacts.each.with_index.collect do |contact|   
            puts "#{contact.values}"
            # puts"...................................................................."
        end
    end    


#     def input_to_index(given_input)
#     given_input.to_i - 1
# end

# def modify_contact(all_contacts)
    
#     display_contacts(all_contacts, true)
#     input = gets.strip
#     position_to_replace = input_to_index(input)
     
#     all_contacts[position_to_replace] = add_contact(all_contacts, true)

#     display_menu
#     choose_option(all_contacts)
# end

# def delete_contact(all_contacts)
#     display_contacts(all_contacts, true)
    
#     input = gets.strip
#     position = input_to_index(input)
#     all_contacts.delete_at(position)
#     puts "You have successfully deleted the contact in line #{position +1}"
#     display_menu
#     choose_option(all_contacts)
# end
  
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
    
def choose_option
    option = gets.chomp
    case option
    when "1"
        add_contact
    when "2"
        Contact.all 
    # when "3"
    #     modify_contact(all_contacts)
    # when "4"
    #     delete_contact(all_contacts)
    # when "5"
    #     exit_contacts(all_contacts)
    #     save()
    else
        puts "Your repertory is empty!"
        
        # choose_option(all_contacts)
    end     
end
end

ContactCli.new.welcome_msg
# ContactCli.new.choose_option
# display_menu

# choose_option(all_contacts)




#     def input_options

#        input = nil

#         until input =='6'
            
#             input =gets.strip.brown
#             # if input == nil && input != 'list 1' && input != 'list 2' && input != 'exit'
#             #     puts "We have no currency for this country.".red
#             # else 
            
        
#             case input
#             when "1"
#                 #add_contact
#             when "2"
#                 # display_contact
#             when "3"
#                 # modify_contact
#             when "4"
#                 # ####
#             when '5'
#                 ######
#                     # puts "\nThis our list of our countries for now:\n".green 
#                     # Country_capitals.create_2
#                     # Country_capitals.list_2
#             when '6'
#                 exit
#             else
#                 puts "Entry #{input} is not exist".red
#             end
#         end
    
#     en
    