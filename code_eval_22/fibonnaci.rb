module Fibonacci
  def self.fibonacci(number)
    number.between?(0,1) ? number : (fibonacci(number - 1) + fibonacci(number - 2))
  end
end

require '../support/process_file'
ProcessFile.new { |line| puts Fibonacci.fibonacci(line.to_i) }
