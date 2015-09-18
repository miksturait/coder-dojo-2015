class SimpleSorting < Struct.new(:text)
  def to_s
    sorted_numbers.
        map { |number| sprintf("%.3f", number) }.
        join(' ')
  end

  private

  def sorted_numbers
    numbers.sort
  end

  def numbers
    text.map(&:to_f)
  end
end


require '../support/process_file'
ProcessFile.new do |line|
  puts SimpleSorting.new(line.split(' '))
end
