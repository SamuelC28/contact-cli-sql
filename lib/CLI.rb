
class ContactCli
    def Welcome_msg
        system('clear')
        sleep(1)
        puts "Welcome To Our Contact Program!\n".bg_green.black
    end

    def menu
        puts "Please, Choose an Option"
        puts "Enter 1 To Add A Contact"
        puts "Enter 2 To Display All Contact"
        puts "Enter 3 To Modify A Contact"
        puts "Enter 4 To Delete A Contact"
        puts "Enter 5 To Delete All Contacts"
        puts "Enter 6 To Exit The Program"
    end
    
    def add_contact
        puts "Create A New Contact!\n"

        puts "Enter Fullname:"
        fullname = gets.chomp
        contact["Fullname"] = fullname

        puts "Enter Address:"
        Address = gets.chomp
        contact["Address"] = address

        puts "Enter E-mail:"
        email = gets.chomp
        contact["Email"] = email

        puts "Enter Phone Number:"
        phone_number = gets.chomp
        contact["Phone Number"] = phone_number

        Contact.create.new(fullname, phone_number, address, email)
    end 

    def input_options

       input = nil

        until input =='6'
            
            input =gets.strip.brown
            # if input == nil && input != 'list 1' && input != 'list 2' && input != 'exit'
            #     puts "We have no currency for this country.".red
            # else 
            
        
            case input
            when "1"
                #add_contact
            when "2"
                # display_contact
            when "3"
                # modify_contact
            when "4"
                # ####
            when '5'
                ######
                    # puts "\nThis our list of our countries for now:\n".green 
                    # Country_capitals.create_2
                    # Country_capitals.list_2
            when '6'
                exit
            else
                puts "Entry #{input} is not exist".red
            end
        end
    
    end

end
    