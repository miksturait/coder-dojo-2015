class GameOfLife < Struct.new(:raw_data)
  VECTORS = [
      [0, 1],
      [0, -1],
      [1, 0],
      [-1, 0],
      [-1, 1],
      [1, 1],
      [1, -1],
      [-1, -1]
  ]

  def new_generation
    new_true_false_matrix = true_false_matrix.map.with_index do |array, x|
      array.map.with_index do |_, y|
        new_live?(true_false_matrix[x][y], neighbors(x, y).count(true))
      end
    end
    new_matrix_with_data(new_true_false_matrix)
  end

  private

  def true_false_matrix
    matrix_with_data.map { |row| row.map { |char| char == '*' } }
  end

  def matrix_with_data
    raw_data.split("\n").map { |line| line.split('') }
  end

  def new_live?(is_alive, live_neighbors)
    live_neighbors == 3 || (is_alive && live_neighbors == 2)
  end

  def neighbors(x, y)
    VECTORS.map do |vector|
      wrong_neighbor?(vector, x, y) ? nil : true_false_matrix[x + vector[0]][y + vector[1]]
    end
  end
  def size
    matrix_with_data.length - 1
  end
  def wrong_neighbor?(vector, x, y)
    x + vector[0] < 0 || x + vector[0] > size || y + vector[1] < 0 || y + vector[1] > size
  end

  def new_matrix_with_data(new_true_false_matrix)
    new_true_false_matrix.map { |row| row.map { |bool| bool ? '*' : '.' }.join('') }.join("\n")
  end
end

class StepGenerator
  def generate(data, number)
    if number == 1
      puts GameOfLife.new(data).new_generation
    else
      generate(GameOfLife.new(data).new_generation, number - 1)
    end
  end
end

data = File.new('input.txt', 'r').read
StepGenerator.new.generate(data, 100)
