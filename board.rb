require 'byebug'
#BOARD
#  1 | 2 | 3 
# -----------
#  4 | 5 | 6 
# -----------
#  7 | 8 | 9 

class Board
	attr_accessor :human_moves, :computer_moves, :spaces
    ROW = [
    		[1,2,3],
    		[4,5,6],
    		[7,8,9]
    ]

    COLUMN = [
    		[1,4,7],
    		[2,5,8],
    		[3,6,9]
    ] 
    
    DIAGONAL = [
    		[1,5,9],
    		[3,5,7]
    ] 

	def initialize
	  self.spaces = Array.new(9)
	  self.human_moves = []
	  self.computer_moves = []
	end
	
	def print_board
      board = ""
      (0..8).each do |position|
      	board << " #{spaces[position]} "
      	case position % 3
      	  when 0, 1 then board << "|"
      	  when 2 then board << "\n------------\n" unless position == 8
      	end
      end
      board
	end

	def place_marker(position, marker)
      spaces[position] = marker
	end
    
    def update_human_moves(position)
      human_moves << position
    end
    
    def update_computer_moves(position)
      computer_moves << position
    end

	def game_over
	  win || tie
	end

	def win	  
	  win_by_column || win_by_row || win_by_diagonal
	end

	def board_full
	  # Here position is element of array so will be either X or O or nil
	  full = true
	  spaces.each do |position|
	  	full = false if !position
	  end
	  return full
	end
    
    def tie
      board_full && !win
    end

	def validate_move(position)
	  if spaces[position].nil?
	  	return true
	  end
	  return false
	end

	def win_by_column
	  (0..2).each do |i|
	  	if (COLUMN[i] - human_moves).empty? || (COLUMN[i] - computer_moves).empty?
	  	  return true
	  	end
	  end
	  return false
	end

	def win_by_row
	  (0..2).each do |i|
	  	if (ROW[i] - human_moves).empty? || (ROW[i] - computer_moves).empty?
	  	  return true
	  	end
	  end
	  return false
	end

	def win_by_diagonal
	  (0..1).each do |i|
	  	if (DIAGONAL[i] - human_moves).empty? || ( DIAGONAL[i] - computer_moves).empty?
	  	  return true
	  	end
	  end
	  return false
	end

	def available_spaces
	  available_space_positions = []
	  spaces.each_with_index do |value, index|
	  	available_space_positions << index if value.nil?
	  end
	  available_space_positions
	end
end