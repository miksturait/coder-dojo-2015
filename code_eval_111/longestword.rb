def longest_word(sentance)
  sentance.split(' ').max { |a, b| a.length <=> b.length }
end

class ProcessFile
  def initialize(filename = ARGV[0])
    File.open(filename, "r").each_line { |line| yield(line) }
  end
end

ProcessFile.new do |line|
  puts longest_word(line)
end
