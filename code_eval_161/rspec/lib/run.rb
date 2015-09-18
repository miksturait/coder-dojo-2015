$:.unshift File.dirname(__FILE__)
require 'init'

ITERATIONS = 10

File.open(ARGV[0], 'r') do |file|
  puts Game::OfLife.new(file.read).generation(ITERATIONS)
end
