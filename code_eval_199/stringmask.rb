class StringUppercaseWithMask
  attr_reader :word, :mask

  def initialize(line)
    @word, @mask = line.split(' ')
  end

  def apply_mask()
    letters.each_with_index do |letter, index|
      if mask[index] == '1'
        letters[index].upcase!
      end
    end.join
  end

  def letters
    word.split(//)
  end

end

File.open(ARGV[0], "r").each_line { |line| puts StringUppercaseWithMask.new(line).apply_mask }
