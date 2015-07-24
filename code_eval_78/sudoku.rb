#sprawdz kazdy wiersz, kolumne i  kwadrat
input_one = "4;1,4,2,3,2,3,1,4,4,2,3,1,3,1,4,2"
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
    size.times.collect do |index|
      rows.map { |row| row[index] }
    end
  end

  private

  def prepare_matrix
    size.times.collect do
      numbers.shift(size)
    end
  end
end

match = input_one.match(/(?<size>\d);(?<numbers>(\d(,)?)+)/)
sudoku = SudokuChecker.new(match['size'].to_i, match['numbers'].split(',').map(&:to_i))

p sudoku.rows
p sudoku.colums


# 2x2
# * 4 vertical
# * 4 horizontal
# * 4 small square

# 0123
# 0123
# 0123
# 0123
#
#
# 012345678
# 012345678
# 012345678
# ...



