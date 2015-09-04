require 'init'
require '../../../../support/process_file'

ProcessFile.new do |generation_as_text|
  game = Game::OfLife.new(generation_as_text)
  puts game.world_size
  p game.neighbours_indexes(0)
end
