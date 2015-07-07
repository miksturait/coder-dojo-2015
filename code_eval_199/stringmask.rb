def apply_mask(word, mask)

  word_splited = word.split(//)

  word_splited.each_with_index do |letter, index|
    if mask[index] == '1'
      word_splited[index].upcase!
    end
  end.join
end

File.open(ARGV[0], "r").each_line { |line| puts apply_mask(*line.split(' ')) }


