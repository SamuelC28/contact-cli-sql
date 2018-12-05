
class ContactCli
#     def Welcome_msg
#         system('clear')
#         sleep(1)
#         puts "Welcome To Our Contact Program!\n".bg_green.black
#     end

#     def menu
#         puts "Please, Choose an Option"
#         puts "Enter 1 To Add A Contact"
#         puts "Enter 2 To Display All Contact"
#         puts "Enter 3 To Modify A Contact"
#         puts "Enter 4 To Delete A Contact"
#         puts "Enter 5 To Delete All Contacts"
#         puts "Enter 6 To Exit The Program"
#     end
    
#     def add_contact
#         puts "Create A New Contact!\n"

#         puts "Enter Fullname:"
#         fullname = gets.chomp
#         contact["Fullname"] = fullname

#         puts "Enter Address:"
#         Address = gets.chomp
#         contact["Address"] = address

#         puts "Enter E-mail:"
#         email = gets.chomp
#         contact["Email"] = email

#         puts "Enter Phone Number:"
#         phone_number = gets.chomp
#         contact["Phone Number"] = phone_number

#         Contact.create.new(fullname, phone_number, address, email)
#     end 

#     # displaying list of contact

#     def display_contacts
#         puts "Full Name | Phone Number | Birthday | Address | E-mail"
#         puts"........................................................................"
#         all_contacts.each.with_index(1).collect do |contact, index|   
#             puts "#{index}. #{contact.values.join(" | ")}"
#             puts"...................................................................."
#         end

#         if all_contacts.empty?
#             puts "Your repertory is empty!"
#         end 
        
#         if deleting == true
#             puts "Please, choose contact line you want to delete!"
#             return all_contacts
#         end

#         display_menu
#         choose_option(all_contacts)
 
#     end    


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
    
# def choose_option(all_contacts)
#     option = gets.chomp
#     case option
#     when "1"
#         add_contact(all_contacts)    
#     when "2"
#         display_contacts(all_contacts)
#     when "3"
#         modify_contact(all_contacts)
#     when "4"
#         delete_contact(all_contacts)
#     when "5"
#         exit_contacts(all_contacts)
#         save()
#     else
#         puts "Your repertory is empty!"
#         display_menu
#         choose_option(all_contacts)
#     end     
# end

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
    
#     end

end
    