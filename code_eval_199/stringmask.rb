string_one = 'hello 11001'
string_two = 'world 10000'
string_three = 'cba 111'

word, mask = string_two.split(' ')

word_splited = word.split(//)
mask_splited = mask.split(//)

word_splited.each_with_index do |letter, index|
  if mask_splited[index] == '1'
    word_splited[index].upcase!
  else
    word_splited[index].downcase!
  end
end

puts word_splited.join
