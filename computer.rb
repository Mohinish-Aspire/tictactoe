class Computer
	# def move(board)
 #    loop do
 #      player_move = rand(9)
 #      if player_move >0 && player_move <= 9
 #        if board.validate_move(player_move-1)
 #          board.place_marker(player_move-1, "o")
 #          board.update_computer_moves(player_move)
 #          return
 #        end
 #      end
 #    end  
    
	# end

  def move(board)
    if one_move = find_one_move_to_win(board)
      board.place_marker(one_move, "o")
      board.update_computer_moves(one_move+1)
    elsif opponent_move = find_opponent_one_move_to_win(board)
      board.place_marker(opponent_move, "o")
      board.update_computer_moves(opponent_move+1)
    elsif middle_available_position = find_middle(board)
      board.place_marker(middle_available_position, "o")
      board.update_computer_moves(middle_available_position+1)
    elsif combo_position = find_combo_position(board)
      board.place_marker(combo_position, "o")
      board.update_computer_moves(combo_position+1)
    else
      any_available_position = find_any_available_position(board)
      board.place_marker(any_available_position, "o")
      board.update_computer_moves(any_available_position)
    end
  end

  private

  def find_one_move_to_win(board)
    spaces = board.spaces.dup
    available_spaces = board.available_spaces
    computer_moves = board.computer_moves.dup
    move = -1
    available_spaces.each do |i|
      board.place_marker(i,"o")
      board.computer_moves << (i+1)
      if board.win
        move = i
        break
      end
      board.spaces = spaces.dup
      board.computer_moves = computer_moves.dup
    end
    board.spaces = spaces.dup
    board.computer_moves = computer_moves.dup
    if move != -1
      return move
    end
    return nil
  end

  def find_opponent_one_move_to_win(board)
    spaces = board.spaces.dup
    available_spaces = board.available_spaces
    human_moves = board.human_moves.dup
    move = -1
    available_spaces.each do |i|
      board.place_marker(i,"x")
      board.human_moves << (i+1)
      if board.win
        move = i
        break
      end
      board.spaces = spaces.dup
      board.human_moves = human_moves.dup
    end
    board.spaces = spaces.dup
    board.human_moves = human_moves.dup
    if move != -1
      return move
    end
    return nil
  end

  def find_middle(board)
    if board.spaces[4].nil?
      return 4 
    end
    return nil
  end

  def find_combo_position(board)
    spaces = board.spaces.dup
    available_spaces = board.available_spaces
    computer_moves = board.computer_moves.dup
    move = -1
    available_spaces.each do |i|
      board.place_marker(i,"o")
      board.computer_moves << (i+1)
      if find_one_move_to_win(board)
        move = i
        break
      end
      board.spaces = spaces.dup
      board.computer_moves = computer_moves.dup
    end
    board.spaces = spaces.dup
    board.computer_moves = computer_moves.dup
    if move != -1
      return move
    end
    return nil
  end

  def find_any_available_position(board)
    board.available_spaces.first
  end
end