require '../support/process_file'

def longest_word(words)
  words.max { |a, b| a.length <=> b.length }
end

ProcessFile.new do |line|
  puts longest_word(line.split(' '))
end
