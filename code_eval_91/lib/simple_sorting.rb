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
