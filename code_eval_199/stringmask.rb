string_one = 'hello 11001'
string_two = 'world 10000'
string_three = 'cba 111'


def apply_mask(word, mask)

  word_splited = word.split(//)

  word_splited.each_with_index do |letter, index|
    if mask[index] == '1'
      word_splited[index].upcase!
    end
  end.join
end

puts apply_mask(*string_two.split(' '))
