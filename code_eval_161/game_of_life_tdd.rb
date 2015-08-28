class GameOfLife < Struct.new(:generation_as_text)
  def generation_without_white_spaces
    generation_as_text.gsub(/\n/, '')
  end

  def world_size
    @world_size ||= Math.sqrt(generation_without_white_spaces.length).to_i
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
  p game[1, 8]
end
