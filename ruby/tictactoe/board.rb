class Board
  include Enumerable
  
  def initialize(cells = nil)
    if cells.nil?
      @cells = [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]
    else
      @cells = cells
    end
  end
  
  def copy
    # Need to manually clone the 2nd level of the array as Ruby would otherwise
    # just copy the refs
    Board.new(cells.collect(&:clone))
  end
  
  def game_ended?
    winner? || no_moves_left?
  end
  
  def winner?
    !get_winner.nil?
  end
  
  def get_winner
    check_horizontal_winner || check_horizontal_winner(cells.transpose) ||
    check_diagonal_winner
  end
  
  def check_horizontal_winner(cells = @cells)
    winning_player_symbol = nil
    
    cells.each do |row|
      # Winning row if all the items are just 1 thing that isn't nil
      r = row.uniq
      if r.count == 1 && !r[0].nil?
        winning_player_symbol = r[0]
        break
      end
    end
    
    winning_player_symbol
  end
  
  def each(&block)
    cells.flatten.each(&block)
  end
  
  def possible_moves
    cells.flatten.collect.with_index do |cell, i|
      cell.nil? ? i : nil
    end.compact
  end
  
  def check_diagonal_winner
    collection_of_diagonals = [
      [
        cells[0][0],
        cells[1][1],
        cells[2][2]
      ],
      [
        cells[2][0],
        cells[1][1],
        cells[0][2]
      ]
    ]
    
    check_horizontal_winner(collection_of_diagonals)
  end
  
  def no_moves_left?
    # No moves left if no nils, so see if compacting doesn't change the size
    cells.flatten.compact.count == 9
  end
  
  def print_state
    puts "Current board state:"

    cells.each do |row|
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
    cells.each do |row|
      row.each do |cell|
        print cell.nil? ? i : cell
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
  
  def make_move(i, player_symbol)
    DBC.require((0..8).include?(i.to_i))

    i = i.to_i
    set_position(i, player_symbol)
  end
  
  def get_position(i)
    DBC.require((0..8).include?(i))

    x = i % 3
    y = i / 3
        
    cells[y][x]
  end
  
  def set_position(i, player_symbol)
    DBC.require((0..8).include?(i))

    x = i % 3
    y = i / 3
    
    cells[y][x] = player_symbol
  end
  
  private
  
  def cells
    @cells
  end
end
