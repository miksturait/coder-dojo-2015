class Game::CoordinatePositionConverter < Struct.new(:world_dimension)
  def to_index(coordinate)
    x, y = coordinate
    y * world_dimension + x
  end

  def to_coordinate(index)
    y = index / world_dimension
    x = index % world_dimension
    [x, y]
  end
end
