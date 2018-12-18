require 'set'

class Table
    # attr_accessor :table
    @@myArr = ["Jon", "Dan", "Cliff", "Lil"]
    def initialize(table =nil)
        @table = table || Array.new(5, "                     ")
      end
      
      def table_top_row
        puts "|      FULL NAME        |     PHONE NUMBER      |        ADDRESS        |         EMAIL         |"
        puts "-" *95
      end
      def table_cell
        puts "| #{@table[0]} | #{@table[1]} | #{@table[2]} | #{@table[3]} | #{@table[4]}"
        puts "-" *95
        
      end
 

      def print_it

        @@myArr.each do |k|
            
             i = 0
            if table_cell[i] == k[i]
               p[i] << k
               i +=1
            end
          
        #  end
        end
            
           
     end
end

