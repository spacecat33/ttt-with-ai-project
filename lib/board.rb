class Board 
    attr_accessor :cells
 
    def reset!
         @cells = Array.new(9, " ")
    end 
    
    def initialize
         reset!
    end
 
    def display 
         puts " #{cells[0]} | #{cells[1]} | #{cells[2]} " 
         puts "-----------"
         puts " #{cells[3]} | #{cells[4]} | #{cells[5]} " 
         puts "-----------"
         puts " #{cells[6]} | #{cells[7]} | #{cells[8]} " 
    end 
 
    def position(input)
         cells[input.to_i-1]
    end
 
    def update(input, player)
        ## updates the cells in the board with the player token (method found in Player Class) according to the input
        cells[input.to_i-1] = player.token
    end

    def full?
         cells.each do |cell|
             if cell == " "
                 return false
             end
         end
     end
 
    def turn_count
        cells.count{|token| token == "X" || token == "O"}
    end

    ##or
    #  def turn_count
    #      ## insert non-empty strings in array and return the length of the array  
    #      count = []
    #      cells.each do |cell|
    #          if cell != " "
    #              count << cell
    #          end 
    #      end
    #      count.length    
    #  end
 
     def taken?(input)
         ## if the position == "X" or "O" return true
         position(input)=="X" || position(input)=="O"
     end

     ##or
    #  def taken?(input)
    #     if (position(input) == " ")|| (position(input) == "") || (position(input)== nil)
    #       return false
    #     else
    #       return true
    #     end
    #  end
 
     def valid_move?(input)
         ## user input between 1-9
         ## not a taken space
        input.to_i.between?(1, 9) && !taken?(input)
     end
 
 end 