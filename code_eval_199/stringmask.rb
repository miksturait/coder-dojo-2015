class StringUppercaseWithMask
  attr_reader :word, :mask

  def initialize(line)
    @word, @mask = line.split(' ')
  end

  def apply_mask()

    word_splited = word.split(//)

    word_splited.each_with_index do |letter, index|
      if mask[index] == '1'
        word_splited[index].upcase!
      end
    end.join
  end

end

File.open(ARGV[0], "r").each_line { |line| puts StringUppercaseWithMask.new(line).apply_mask }
