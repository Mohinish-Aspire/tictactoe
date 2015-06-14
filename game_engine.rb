require_relative 'human'
require_relative 'computer'
require_relative 'board'
class GameEngine
	def initialize
	  @board = Board.new
	  @human = Human.new
	  @computer = Computer.new
	  @player = [@human, @computer].cycle
	  @current_player = nil
	end
	
	def play
	  while !@human.name
	  	puts "Enter your name player 1: "
	  	@human.name = gets.chomp
	  end
      puts "LET THE GAMES..... BEGIIIIINNNNNNNNNN"

      while !@board.game_over
        puts @board.print_board
        @current_player = @player.next
        @current_player.move(@board)
        system "clear"
      end
      check_win_or_tie
      puts @board.print_board
	end

	def check_win_or_tie
	  if @board.win
	    if @current_player.is_a? Human
	      puts "#{@human.name} Wins. Congratulations"
	    else
	      puts "Puny Human Loses... HAHAHA!!! Computer Wins"
	    end
      end
	  
      if @board.tie
      	puts "Its a tie."
      end
	end
end