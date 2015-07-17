#sprawdz kazdy wiersz, kolumne i  kwadrat
input_one = "4;1,4,2,3,2,3,1,4,4,2,3,1,3,1,4,2"
input_two = "4;2,1,3,2,3,2,1,4,1,4,2,3,2,3,4,1"
class SudokuChecker
  attr_reader :line

  def initialize(line)
    @line=line
  end

  def data_prepare
    @sudoku_size, sudoku_data = line.split(";")
    @sudoku_data = sudoku_data.split(",")
    sudoku_grid = []
    @sudoku_size.to_i.times do |n|
      sudoku_grid << @sudoku_data.shift(@sudoku_size.to_i)
    end
    sudoku_grid.to_s
  end

end

puts SudokuChecker.new(input_one).data_prepare
