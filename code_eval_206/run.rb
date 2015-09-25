require '../support/process_file'
require './lib/simple_sorting'

ProcessFile.new do |line|
  puts SimpleSorting.new(line.split(' '))
end
