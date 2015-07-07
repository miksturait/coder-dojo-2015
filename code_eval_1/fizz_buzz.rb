class FizzBuzz
  def initialize(filename)
    @filename = filename
  end

  def fizz_buzz(fizz_divider, buzz_divider, number_of_iterations)
    (1..number_of_iterations).map do |number|
      if number % fizz_divider == 0 && number % buzz_divider == 0
        'FB'
      elsif number % fizz_divider == 0
        'F'
      elsif number % buzz_divider == 0
        'B'
      else
        number
      end
    end
  end

  def print
    file.each_line do |i|
      puts (fizz_buzz *prepare_argv(i)).join(" ")
    end
  end

  def prepare_argv(i)
    i.split.map(&:to_i)
  end

  private

  def file
    @file ||= File.open(@filename, "a+")
  end
end

fizzbuzz = FizzBuzz.new ARGV[0]
fizzbuzz.print
