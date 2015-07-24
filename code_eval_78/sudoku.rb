class SudokuChecker
  attr_reader :numbers, :size
  attr_accessor :matrix

  def initialize(size, numbers)
    @size = size
    @numbers = numbers
  end

  def to_s
    sudoku?.to_s.capitalize
  end

  def sudoku?
    (rows + colums + small_squares).all? { |element| element.sort == (1..size).to_a }
  end

  private

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
            row_index = y + (square_number_y * square_root_size)
            column_index = x + (square_number_x * square_root_size)
            square.push rows[row_index][column_index]
          end
        end
        squares.push square
      end
    end
    squares
  end

  def square_root_size
    @square_root_size ||= Math.sqrt(size).to_i
  end

  def prepare_matrix
    size.times.collect do
      numbers.shift(size)
    end
  end
end

require '../support/process_file'
class ProcessFile
  Opts = Struct.new(:line) do
    def attrs
      [size, numbers]
    end

    def size
      @size ||= match['size'].to_i
    end

    def numbers
      @numbers ||= process_numbers
    end

    private

    def process_numbers
      match['numbers'].split(',').map(&:to_i)
    end

    def match
      @match ||= line.match(/(?<size>\d);(?<numbers>(\d(,)?)+)/)
    end
  end
end

ProcessFile.new do |line|
  puts SudokuChecker.new(*ProcessFile::Opts.new(line).attrs)
end

