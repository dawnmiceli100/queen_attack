class Queens
  attr_reader :white, :black, :chessboard

  BOARD_ROWS = 8
  BOARD_COLUMNS = 8

  def initialize(positions = {})
    default_positions = { white: [0, 3], black: [7, 3] }
    positions = default_positions.merge(positions)
    validate_positions(positions)
    @white = positions[:white]
    @black = positions[:black]
    @chessboard = Board.new(BOARD_ROWS, BOARD_COLUMNS, white, black)
  end 

  def to_s
    return chessboard.board_array.join.chomp
  end 

  def attack?
    in_same_row? || in_same_column? || on_same_diagonal?
  end  

  private

  def validate_positions(positions)
    raise ArgumentError.new("Queens cannot be on the same space.") if positions[:white] == positions[:black]
  end

  def in_same_row?
    white[0] - black[0] == 0
  end 

  def in_same_column?
    white[1] - black[1] == 0
  end 

  def on_same_diagonal?
    (white[0] - black[0]).abs == (white[1] - black[1]).abs
  end  
end

class Board
  attr_reader :board_array

  def initialize(rows, columns, white, black)
    @board_array = Array.new(rows) { Array.new(columns, "_") }
    @board_array[white[0]][white[1]] = "W"
    @board_array[black[0]][black[1]] = "B"
    @board_array.each_index { |i| @board_array[i] = @board_array[i].join(" ") + "\n" }
  end  
end  