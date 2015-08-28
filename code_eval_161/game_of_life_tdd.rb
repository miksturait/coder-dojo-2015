class GameOfLife < Struct.new(:generation_as_text)
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
    [x,y]
  end

  def [](x, y)
    generation_without_white_spaces[coordinate_to_index(x, y)]
  end

  def neighbours_indexes(index)
    coords = index_to_coordinate(index)
    neighbours_coords = VECTORS.map {|vx, vy| [coords[0] + vx, coords[1] + vy]   }
    select_real_neighbours(neighbours_coords).map {|coords| coordinate_to_index(*coords)}
  end

  def select_real_neighbours(coordinates)
       coordinates.select do |x, y|
         in_world?(x) && in_world?(y)
       end
  end

  def in_world?(y)
    y.between?(0, world_size - 1)
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

ProcessFile.new do |generation_as_text|
  game = GameOfLife.new(generation_as_text)
  puts game.world_size
  p game.neighbours_indexes(0)
end
