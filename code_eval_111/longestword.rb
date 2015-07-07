sentance_one = 'some line with text'
sentance_two = 'another line'

# find the first longest word in sentance

puts sentance_one.split(' ').max {|a, b| a.length <=> b.length}
puts sentance_one.split(' ').max {|a, b| a.length <=> b.length}
