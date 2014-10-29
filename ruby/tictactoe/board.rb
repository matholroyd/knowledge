class Board
  include Enumerable
  
  attr_accessor :places
  
  def initialize(places = nil)
    if places.nil?
      @places = [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]
    else
      @places = places
    end
  end
  
  def copy
    # Need to manually clone the 2nd level of the array as Ruby would otherwise
    # just copy the refs
    Board.new(places.collect(&:clone))
  end
  
  def game_ended?
    winner? || no_moves_left?
  end
  
  def winner?
    !get_winner.nil?
  end
  
  def get_winner
    check_horizontal_winner || check_horizontal_winner(places.transpose) ||
    check_diagonal_winner
  end
  
  def check_horizontal_winner(places = @places)
    winning_player_symbol = nil
    
    places.each do |row|
      row = row.uniq
      if row.count == 1 && !row[0].nil?
        winning_player_symbol = row[0]
        break
      end
    end
    
    winning_player_symbol
  end
  
  def each(&block)
    places.flatten.each(&block)
  end
  
  def possible_moves
    places.flatten.collect.with_index do |place, i|
      place.nil? ? i : nil
    end.compact
  end
  
  def check_diagonal_winner
    collection_of_diagonals = [
      [
        places[0][0],
        places[1][1],
        places[2][2]
      ],
      [
        places[2][0],
        places[1][1],
        places[0][2]
      ]
    ]
    
    check_horizontal_winner(collection_of_diagonals)
  end
  
  def no_moves_left?
    # No moves left if no nils, so see if compacting doesn't change the size
    places.flatten.compact.count == 9
  end
  
  def print_state
    puts "Current board state:"

    places.each do |row|
      row.each do |column|
        print column.nil? ? '-' : column
        print " "
      end
      print "\n"
    end
  end
  
  def print_moves
    puts "Enter a number to pick your move"
    i = 0
    places.each do |row|
      row.each do |column|
        print column.nil? ? i : column
        print " "
        i += 1
      end
      print "\n"
    end
  end
  
  def legal_move?(move)
    i = move.to_i
    
    (0..8).include?(i) && get_position(i).nil?
  end
  
  def make_move(move, symbol)
    i = move.to_i
    set_position(i, symbol)
  end
  
  def get_position(i)
    x = i % 3
    y = i / 3
        
    places[y][x]
  end
  
  def set_position(i, change)
    x = i % 3
    y = i / 3
    
    places[y][x] = change
  end
end
