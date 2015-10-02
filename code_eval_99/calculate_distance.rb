class Point < Struct.new(:coins_from_float, :y);
end

class DistanceCalculation < Struct.new(:point_a, :point_b)
  def to_s
    distance.to_s
  end

  def distance
    vector_z.to_i
  end

  private

  def vector_z
    Math.sqrt((vector_x**2) + (vector_y**2))
  end

  def vector_x
    points.map(&:coins_from_float).inject(:-)
  end

  def vector_y
    points.map(&:y).inject(:-)
  end

  def points
    [point_a, point_b]
  end
end

require '../support/process_file'
ProcessFile.new do |line|
  coordinates = line.scan(/-?\d+/).map(&:to_i)

  puts DistanceCalculation.new(
           Point.new(coordinates.shift, coordinates.shift),
           Point.new(coordinates.shift, coordinates.shift))
end
