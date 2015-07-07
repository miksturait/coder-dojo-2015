require '../support/process_file'

def longest_word(sentance)
  sentance.split(' ').max { |a, b| a.length <=> b.length }
end

ProcessFile.new do |line|
  puts longest_word(line)
end
