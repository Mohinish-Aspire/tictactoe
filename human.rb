class Human
  attr_accessor :name
  def move(board)
	  while true
	  	#before this should already have logic to end game if board full or tied
        puts "Make Your Move: "
        player_move = gets
        begin
          player_move = player_move.to_i
          if player_move >0 && player_move <= 9
          	if board.validate_move(player_move-1)
            	board.place_marker(player_move-1, "x")
            	board.update_human_moves(player_move)
            	return
          	end
          end
          puts "Cheap shot dude. Wanna try again?"	
        rescue Exception => e
          puts "Incorrect input."	
        end
        
	  end
	end
end