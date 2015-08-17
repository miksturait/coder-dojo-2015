class MinimumDistance < Struct.new(:number_of_friends, :friends_house_numbers)
  def to_s
    minimal_distances.to_s
  end

  def minimal_distances
    distances.min
  end

  private

  def distances
    (potential_house_numbers).map do |potential_house_number|
      sum_distance_to_every_friends_house_from(potential_house_number)
    end
  end

  def sum_distance_to_every_friends_house_from(house_numer)
    friends_house_numbers.reduce(0) { |memo, friends_house_number| memo + (friends_house_number - house_numer).abs }
  end

  def potential_house_numbers
    friends_house_numbers.min..friends_house_numbers.max
  end
end

require '../support/process_file'
ProcessFile.new do |line|
  input = line.split.map(&:to_i)
  puts MinimumDistance.new(input.shift, input)
end
