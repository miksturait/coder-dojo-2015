class MajorElement < Struct.new(:numbers)
  def to_s
    (major_number || 'None').to_s
  end

  def major_number
    potencial_major_number_stats[0] if is_major_number?
  end

  private

  def potencial_major_number_stats
    numbers_stats.max { |(key, value), (_, value_b)| value <=> value_b }
  end

  def numbers_stats
    numbers.each.with_object(Hash.new(0)) do |number, cache|
      cache[number] += 1
    end
  end

  def is_major_number?
    major_number_occurances > (numbers.length / 2)
  end

  def major_number_occurances
    potencial_major_number_stats[1]
  end
end

File.open('input.txt').each_line do |line|
  numbers = line.split(',').map(&:to_i)
  puts MajorElement.new(numbers)
end
