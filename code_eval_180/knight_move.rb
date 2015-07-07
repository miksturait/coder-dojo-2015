class Knight
  attr_reader :start_position

  VECTORS = [ [-2, -1], [-2, +1], [-1, -2], [-1, +2], [+1, -2], [+1, +2], [+2, -1], [+2, +1] ]
  BOARD_RANGE = (1..8)
  LETTER_TO_NUMBER = ' abcdefgh'

  def initialize(start_position)
    @start_position = start_position
  end

  def possible_positions
    coordinates_to_positions.join(' ')
  end

  private

  def coordinates_to_positions
    in_board_coordinates.collect do |coordinates|
      LETTER_TO_NUMBER[coordinates[0]] + coordinates[1].to_s
    end
  end

  def in_board_coordinates
    eigth_coordinates.select { |new_x, new_y| BOARD_RANGE.include?(new_x) && BOARD_RANGE.include?(new_y) }
  end

  def eigth_coordinates
    VECTORS.collect { |vector_x, vector_y| [x+vector_x, y+vector_y] }
  end

  def x
    LETTER_TO_NUMBER.index(start_position[0])
  end

  def y
    start_position[1].to_i
  end
end

def verify(start_position, correct_possible_positions)
  some_knight = Knight.new(start_position)
  calculated_possible_positions = some_knight.possible_positions

  if calculated_possible_positions == correct_possible_positions
    puts "OK :-)"
  else
    puts "Something Wrong for '#{start_position}' => '#{calculated_possible_positions}' instead '#{correct_possible_positions}'"
  end
end

def suit
  verify('g2', "e1 e3 f4 h4")
  verify('a1', 'b3 c2')
  verify('d6', 'b5 b7 c4 c8 e4 e8 f5 f7')
  verify('e5', 'c4 c6 d3 d7 f3 f7 g4 g6')
  verify('b1', 'a3 c3 d2')
end

suit
