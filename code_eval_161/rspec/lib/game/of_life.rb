class Game::OfLife < Struct.new(:generation_as_text)
  def next_generation
    next_generation_without_white_spaces

    # world without white spaces
    # for each cell compute next generation cell
    # add white spaces
  end

  def next_generation_without_white_spaces
    generation_without_white_spaces.split('').each.with_index.with_object("") do |(cell, index), new_generation|
      live_neighbours = Game::Neighbours.new(index, generation_without_white_spaces, dimension).live_amount
      new_generation << Game::NextCellGeneration.new(cell, live_neighbours).next_state
      new_generation << "\n" if ((index + 1) % dimension) == 0
    end
  end

  def generation_without_white_spaces
    generation_as_text.gsub(/\n/, '')
  end

  def dimension
    @dimension ||= Math.sqrt(world_length).to_i
  end

  def world_length
    @world_length ||= generation_without_white_spaces.length
  end

  def [](x, y)
    generation_without_white_spaces[converter.to_index(x, y)]
  end


end


# class ProcessFile
#   def initialize(filename = ARGV[0])
#     @filename = filename
#     yield(file_body())
#   end
#
#   private
#
#   def file_body()
#     File.open(@filename, "r").read
#   end
# end




