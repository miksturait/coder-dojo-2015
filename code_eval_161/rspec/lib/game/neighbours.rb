class Game::Neighbours < Struct.new(:index, :world, :world_size)
  def all
    all_coordinates.map { |coords| converter.to_index(coords) }
  end

  def live_amount
    all.map { |index| world[index] }.
        count { |cell| cell == '*' }
  end

  private

  def all_coordinates
    neighbours_coordinates(converter.to_coordinate(index))
  end

  def neighbours_coordinates(coords)
    Game::NeighboursCoordinates.new(coords, world_size).reachable
  end

  def converter
    @converter ||= Game::CoordinatePositionConverter.new(world_size)
  end
end
