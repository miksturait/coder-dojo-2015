#sprawdz kazdy wiersz, kolumne i  kwadrat
input_one = "9;#{(1..81).to_a.join(',')}"
input_two = "4;2,1,3,2,3,2,1,4,1,4,2,3,2,3,4,1"
class SudokuChecker
  attr_reader :numbers, :size
  attr_accessor :matrix

  def initialize(size, numbers)
    @size = size
    @numbers = numbers
  end

# * square of first number
# * rows
# * columns
# * small squares
# * check for duplicates

  def matrix
    @matrix ||= prepare_matrix
  end

  def rows
    matrix
  end

  def colums
    rows.transpose
  end

  def small_squares
    squares = []
    square_root_size.times do |square_number_y|
      square_root_size.times do |square_number_x|
        square = []
        square_root_size.times do |x|
          square_root_size.times do |y|
            row_index = y + (square_number_x * square_root_size)
            column_index = x + (square_number_y * square_root_size)
            square.push rows[row_index][column_index]
          end
        end
        squares.push square
      end
    end
    squares
  end

  private

  def square_root_size
    @square_root_size ||= Math.sqrt(size).to_i
  end

  def prepare_matrix
    size.times.collect do
      numbers.shift(size)
    end
  end
end

match = input_one.match(/(?<size>\d);(?<numbers>(\d(,)?)+)/)
sudoku = SudokuChecker.new(match['size'].to_i, match['numbers'].split(',').map(&:to_i))

puts sudoku.rows.map { |row| row.join(" ") }.join("\n")
p sudoku.small_squares

