class Game::OfLife < Struct.new(:generation_as_text)

  def generation_without_white_spaces
    generation_as_text.gsub(/\n/, '')
  end

  def world_size
    @world_size ||= Math.sqrt(world_length).to_i
  end

  def world_length
    @world_length ||= generation_without_white_spaces.length
  end

  def coordinate_to_index(x, y)
    y * world_size + x
  end

  def index_to_coordinate(index)
    y = index / world_size
    x = index % world_size
    [x, y]
  end

  def [](x, y)
    generation_without_white_spaces[coordinate_to_index(x, y)]
  end

  def neighbours_indexes(index)
    real_neighbour_coordinates(index).map { |coords| coordinate_to_index(*coords) }
  end

  def neighbours_coordinates(coords)
    Game::Neighbours.new(coords, word_size).reachable
  end

  def real_neighbour_coordinates(index)
    neighbours_coordinates(index_to_coordinate(index))
  end

  def live_neighbours_count(starting_index)
    neighbours_indexes(starting_index).
        map { |index| generation_without_white_spaces[index] }.
        count { |neighbour| neighbour == '*' }
  end
end


class ProcessFile
  def initialize(filename = ARGV[0])
    @filename = filename
    yield(file_body())
  end

  private

  def file_body()
    File.open(@filename, "r").read
  end
end


