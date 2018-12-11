
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
            Cli.new.display_all_contacts_without_order
            puts "You Have No Registered Contacts In Your Repertory.".cyan if Contact.all.empty?
            sleep(1) 
            Cli.new.back_to_menu
            show_option 
        when "3"
           All_messages.new.modify_options
        when "4"
            Cli.new.crash_app
        when "5"
            All_messages.new.delete_options
        when '6'
            Cli.new.find_a_contact
        when 'q'
             Cli.new.exit_contacts
        else 
            All_messages.new.message_restriction
            show_option
        end   
    end
end



