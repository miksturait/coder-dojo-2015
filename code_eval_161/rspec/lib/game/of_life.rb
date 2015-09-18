class Game::OfLife < Struct.new(:generation_as_text)
  def next_generation
    cell_iterator.with_object("") do |(cell, index), new_generation|
      new_generation << next_cell_state(cell, index)
      new_generation << "\n" if ((index + 1) % dimension) == 0
    end
  end

  def next_cell_state(cell, index)
    live_neighbours = Game::Neighbours.new(index, generation_without_white_spaces, dimension).live_amount
    Game::NextCellGeneration.new(cell, live_neighbours).next_state
  end

  def cell_iterator
    generation_without_white_spaces.split('').each.with_index
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




