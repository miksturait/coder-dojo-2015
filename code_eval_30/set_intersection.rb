class SetIntersection < Struct.new(:set_a, :set_b)
  def to_s
    intersection.join(',')
  end

  def intersection
    set_a & set_b
  end
end

require '../support/process_file'
ProcessFile.new do |line|
  sets = line.split(';').map { |set| set.split(',') }
  puts SetIntersection.new(*sets)
end
