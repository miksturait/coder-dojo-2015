class Game::Neighbours < Struct.new(:coordinate, :world_size)
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
    every.select { |x, y| in_world?(x) && in_world?(y) }
  end

  private

  def every
    VECTORS.map { |vx, vy| [x + vx, y + vy] }
  end

  def y
    coordinate[1]
  end

  def x
    coordinate[0]
  end

  def in_world?(number)
    number.between?(0, world_size - 1)
  end
end
