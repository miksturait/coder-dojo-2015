class Game::CoordinatePositionConverter < Struct.new(:world_size)
  def to_index(coordinate)
    x, y = coordinate
    y * world_size + x
  end

  def to_coordinate(index)
    y = index / world_size
    x = index % world_size
    [x, y]
  end
end
