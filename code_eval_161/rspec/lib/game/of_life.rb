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




