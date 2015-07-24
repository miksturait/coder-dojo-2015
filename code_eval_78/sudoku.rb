#sprawdz kazdy wiersz, kolumne i  kwadrat
input_one = "4;1,4,2,3,2,3,1,4,4,2,3,1,3,1,4,2"
input_two = "4;2,1,3,2,3,2,1,4,1,4,2,3,2,3,4,1"
class SudokuChecker
  attr_reader :numbers, :size
  attr_accessor :matrix

  def initialize(size, numbers)
    @size = size
    @numbers = numbers
    @matrix = []
  end

# * square of first number
# * rows
# * columns
# * small squares
# * check for duplicates

  def data_prepare
    size.times do
      matrix.push numbers.shift(size)
    end
    p matrix
  end

end

match = input_one.match(/(?<size>\d);(?<numbers>(\d(,)?)+)/)
puts SudokuChecker.new(match['size'].to_i, match['numbers'].split(',').map(&:to_i)).data_prepare


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



