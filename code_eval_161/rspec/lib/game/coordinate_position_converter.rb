class Game::CoordinatePositionConverter < Struct.new(:world_dimension)
  def to_index(coordinate)
    x, y = coordinate
    y * world_dimension + x
  end

  def to_coordinate(index)
    [coordinate_x(index), coordinate_y(index)]
  end

  private

  def coordinate_x(index)
    index % world_dimension
  end

  def coordinate_y(index)
    index / world_dimension
  end
end
