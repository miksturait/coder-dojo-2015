
def longest_word(sentance)
  sentance.split(' ').max { |a, b| a.length <=> b.length }
end

File.open("input.txt", "r").each_line { |line| puts longest_word(line) }
