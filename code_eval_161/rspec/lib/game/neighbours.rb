class Game::Neighbours < Struct.new(:coordinate, :word_size)
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

  def reachable
    []
  end

  private

  def neighbours_coordinates(coords)
    VECTORS.map { |vx, vy| [coords[0] + vx, coords[1] + vy] }
  end

  def select_real_neighbours(coordinates)
    coordinates.select { |x, y| in_world?(x) && in_world?(y) }
  end

  def in_world?(y)
    y.between?(0, world_size - 1)
  end
end
