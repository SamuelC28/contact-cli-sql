class All_messages
    def welcome_msg
        system("clear")
        sleep(1)
        puts "=" * 90
        puts "                               Welcome To Our Contact Program!".green
        puts "=" * 90
        puts ""
        Menu.new.show_option
    end

    def message_restriction
        puts "Enter a Valid Input To Continue!".red
        sleep(2)
    end 
    
    def delete_options
        system('clear')
            puts "Choose An Option:\nA: Delete Only A Contact\nB: Delete The entire Contacts\n".cyan
            delete_option = gets.chomp
            if delete_option == 'a' || delete_option == 'A'
                Cli.new.delete_a_contact
            elsif delete_option == 'b' || delete_option =='B'
                Cli.new.delete_all_data_from_table
            else
                puts "Entry '#{delete_option}' Is Not A valid Option!".red
                All_messages.pause_and_clear_screen
                # All_messages.new.message_restriction
                delete_options
            end  
    end
        
    def modify_options
        system('clear')
        puts "Chooose An Option:\nA: Modify  A Whole Contact\nB: Modify Only Name\nC: Mofify only Phone Number\nD: Modify Only Address\nE: Modify Only Email".cyan
        modify_option = gets.chomp
        if modify_option == 'a' || modify_option == 'A'
            Cli.new.modify_a_contact
        elsif modify_option == 'b' || modify_option == 'B'
            Cli.new.alter_name
        elsif modify_option == 'c' || modify_option =='C'
            Cli.new.alter_phone_number
        elsif modify_option == 'd' || modify_option == 'D'
            Cli.new.alter_address
        elsif modify_option == 'e' || modify_option == 'E'
            Cli.new.alter_email
        else
            message_restriction
            return modify_options
        end
    end

    def pause_and_clear_screen
        sleep(1.50)
        system('clear')
    end    
    
   
end