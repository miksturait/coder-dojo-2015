$:.unshift File.dirname(__FILE__)
require 'init'
require 'ruby-prof'
require 'benchmark'

ITERATIONS = 10

File.open(ARGV[0], 'r') do |file|
  game = Game::OfLife.new(file.read)
  game.generation(ITERATIONS)

  puts game.display
end

