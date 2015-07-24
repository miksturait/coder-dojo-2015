class FizzBuzz
  def initialize(filename)
    @filename = filename
  end

  def fizz_buzz_elements(opts)
    (1..opts.number_of_iterations).map do |number|
      if number % opts.fizz_divider == 0 && number % opts.buzz_divider == 0
        'FB'
      elsif number % opts.fizz_divider == 0
        'F'
      elsif number % opts.buzz_divider == 0
        'B'
      else
        number
      end
    end
  end

  def print
    file.each_line do |line|
      puts fizz_buzz(Opts.new(line))
    end
  end

  def fizz_buzz(opts)
    fizz_buzz_elements(opts).join(" ")
  end

  private

  def file
    @file ||= File.open(@filename, "a+")
  end

  class Opts
    def initialize(line)
      @numbers = line
    end

    def fizz_divider
      prepare_argv[0]
    end

    def buzz_divider
      prepare_argv[1]
    end

    def number_of_iterations
      prepare_argv[2]
    end

    private

    def prepare_argv()
      @prepare_argv ||= @numbers.split.map(&:to_i)
    end
  end
end

fizzbuzz = FizzBuzz.new ARGV[0]
fizzbuzz.print
