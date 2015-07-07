sentance_one = 'some line with text'
sentance_two = 'another line something'

# find the first longest word in sentance


def longest_word(sentance)
  sentance.split(' ').max { |a, b| a.length <=> b.length }
end

[sentance_one, sentance_two].each { |sentance| puts longest_word(sentance) }
