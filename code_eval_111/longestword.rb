def longest_word(sentance)
  sentance.split(' ').max { |a, b| a.length <=> b.length }
end

File.open(ARGV[0], "r").each_line { |line| puts longest_word(line) }
