
class Menu
    def show_option
        puts "What would you like to do?\n1: Add a new contact\n2: Display contacts\n3: Modification Option\n4: Crash Your App\n5: Delete A Options\n6: Search A Contact\nq: To Exit The Program".green
        option = gets.chomp.to_s
        case option
        when "1"
            Cli.new.add_contact
            system('clear')
            show_option
        when "2"
            # if 
            is_exist = false
            if Contact.create_table
                Cli.new.display_all_contacts_without_order
                show_option
                is_exist = true
            else #!is_exist
                !is_exist
                system('clear')
                puts "Your program was crashed.\nGo to menu to rebuild it!\n".upcase.red
                # return show_option
            end
            
            
        when "3"
             All_messages.new.modify_options
        when "4"
            empty_contact_message
            Cli.new.crash_app
        when "5"
            empty_contact_message
            All_messages.new.delete_options
        when '6'
            empty_contact_message
            Cli.new.find_a_contact
        when 'q'
             Cli.new.exit_contacts
        else 
            All_messages.new.message_restriction
            show_option
        end   
    end

    def empty_contact_message
        if Contact.all.empty?
            system ('clear')
            puts "You Have No Registered Contacts In Your Repertory.".cyan 
            sleep(1)
            Cli.new.back_to_menu
            show_option
        # else
        end
    end
end



