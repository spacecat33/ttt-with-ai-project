class Game 

    attr_accessor :board, :player_1, :player_2

    WIN_COMBINATIONS = [
        [0,1,2], # top_row 
        [3,4,5], # middle_row 
        [6,7,8], # bottom_row 
        [0,3,6], # left_column 
        [1,4,7], # center_column 
        [2,5,8], # right_column 
        [0,4,8], # left_diagonal 
        [2,4,6] # right_diagonal 
        ]

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    # re namespacing:  when you call your Human class, you'll have to call it inside its name space with Players::Human due to code in players module.   
        @board = board 
        @player_1 = player_1
        @player_2 = player_2
    end
    
    def current_player 
        @board.turn_count % 2 == 0 ? player_1 : player_2
    end

    def won?
        WIN_COMBINATIONS.detect do |winner|
            @board.cells[winner[0]] == @board.cells[winner[1]] &&
            @board.cells[winner[1]] == @board.cells[winner[2]] &&
            (@board.cells[winner[0]] == "X" || @board.cells[winner[0]] == "O")
        end
    end

    def draw?
        @board.full? && !won?
    end 


    def over?
       won? || draw?
    end
    
    ## or:
    # def over?
    # if draw? || won? || full?
    # return true
    # end
    
    def winner 
        if win_combo = won?
            @board.cells[win_combo[0]]   #or: @winner = @board.cells[combo.first]
        end
    end 

    def turn
        player = current_player
        current_move = player.move(board)

        if @board.valid_move?(current_move)
            @board.update(current_move, player)
        else 
            turn
        end
    end


    def play
        turn until over?
        puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
    end

    ## or:
    # def play
    #     turn until over?
    #     if won?
    #       puts "Congratulations #{winner}!"
    #     elsif draw?
    #       puts "Cat's Game!"
    #     end
    #   end
end 

# def start [draft]
#     puts "Welcome to Tic Tac Toe!"
#     puts "What kind of game would you like to play? 0 player, 1 player, 2 player or wargames?"
#     if "wargames", puts Computer
#     else reset!
#     puts "Who would like to go first using token X"?
#     start = TicTacToe.new
#     start.play
# end
# end