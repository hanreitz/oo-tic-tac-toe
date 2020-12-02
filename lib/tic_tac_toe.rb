class TicTacToe
    WIN_COMBINATIONS = [
        [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]
    ]

    def initialize
        @board = Array.new(9, " ")
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        move = input.to_i - 1
    end

    def move(position, token)
        @board[position] = token
    end

    def position_taken?(index)
        @board[index] == " " ? false : true
    end

    def valid_move?(position)
        position.between?(0,8) && position_taken?(position) == false ? true : false
    end

    def turn_count
        @board.count {|space| space != " "}
    end

    def current_player
        @board.count{|space| space.eql?("X")} > @board.count{|space| space.eql?("O")} ? "O" : "X"
    end

    def turn
        puts "Choose a position 1-9"
        raw_input = gets
        input = input_to_index(raw_input)
        valid_move?(input) ? move(input, current_player) : turn
        display_board
    end

    def won?
        WIN_COMBINATIONS.any? do |combo|
            if @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && position_taken?(combo[0])
                return combo
            end
        end  
    end

    def full?
        @board.any? {|space| space == " "} ? false : true
    end

    def draw? 
        full? && !won?
    end

    def over?
        draw? | won?
    end

    def winner
        if combo = won? 
            @board[combo[0]]
        end
    end

    def play
        turn until over?
        if game = won?
            puts "Congratulations #{winner}!"
        else
            puts "Cat's Game!"
        end
    end

end
