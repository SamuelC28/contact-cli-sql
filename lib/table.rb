require 'set'

class Table
    # attr_accessor :table
    @@myArr = ["Jon", "Dan", "Cliff", "Lil"]
    def initialize(table =nil)
        @table = table || Array.new(5, " ")
      end

      def table_top_row
        puts "|  ID  |        FULL NAME      |     PHONE NUMBER    |        ADDRESS        |         EMAIL         |".cyan
        puts "-" *95
      end

      def table_cell
        puts " #{@table[0]} } |  #{@table[1]} | #{@table[2]} | #{@table[3]} | #{@table[4]}"
         
        puts "-" *95
      end

      def print_it

        @@myArr.each do |k|
            
             i = 0
            if table_cell[i] == k[i]
               p[i] << k
               i +=1
            end
<<<<<<< HEAD
        end    
=======
        end  
>>>>>>> c19e89529f2f5f9339e49c424a1922c423bb50b6
     end
end

