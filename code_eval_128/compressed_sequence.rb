class CompressedSequence < Struct.new(:numbers)
  def to_s
    compressed.join(' ')
  end

  private

  def compressed
    numbers.each_with_object([]) do |number, stack|
      number_exactly_as_previous?(number, stack) ? stack.last.increment : stack.push(Stats.new(number))
    end
  end

  def number_exactly_as_previous?(number, stack)
    stack.last && stack.last.number == number
  end

  class Stats
    attr_reader :number

    def initialize(number)
      @number = number
      @counter = 1
    end

    def increment
      @counter += 1
    end

    def to_s
      [@counter, number].join(' ')
    end
  end
end

require '../support/process_file'
ProcessFile.new { |line| puts CompressedSequence.new(line.split) }
