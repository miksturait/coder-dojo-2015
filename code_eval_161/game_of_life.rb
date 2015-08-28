class GameOfLife < Struct.new(:raw_data)
  def matrix
    raw_data.split("\n").map { |line| line.split('') }
  end
  def true_false_matrix
    matrix.map{|row| row.map { |char| char == '*'}}
  end
  def neighbors(x,y)
    vectors = [
        [1, 0],
        [-1,0],
        [0,1],
        [0,-1],
        [1,1],
        [-1,-1],
        [1,-1],
        [-1,1]
    ]
    result = vectors.map{|vx, vy| true_false_matrix[y+vy][x+vx]}.count{|neighbor| neighbor }
  end

  def next_live?(char)
    if char
      # Any live cell with fewer than two live neighbors dies, as if caused by under-population.
      return false if neighbors.result < 2 || neighbors.result > 3
      # Any live cell with two or three live neighbors lives on to the next generation.
      return true if neighbors.result == 2 || neighbors.result == 3
      # Any live cell with more than three live neighbors dies, as if by overcrowding.
    else
      # Any dead cell with exactly three live neighbors becomes a live cell, as if by reproduction.
      true if neighbors.result == 3
    end
  end
  def next_generation
      true_false_matrix.map.with_index { |row, y | row.map.with_index{|char, x| next_live?(char)}}
  end
end

game = GameOfLife.new(File.open(ARGV[0], "r").read)
p game.matrix
p game.true_false_matrix
