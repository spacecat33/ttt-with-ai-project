class Player 
    attr_reader :token
    
    def initialize(token)
        @token = token
    end
end 

# Every player subclass will implement a move method that represents how that 
# type of player makes a move in Tic-tac-toe. Found in 'computer' and 
# 'human' classes (both of which will inherit the parent's, 'Player', class properties).