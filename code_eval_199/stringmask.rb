class StringUppercaseWithMask
  attr_reader :word, :mask

  def initialize(line)
    @word, @mask = line.split(' ')
  end

  def to_s
    apply_mask.join
  end

  private

  def apply_mask()
    letters.each_with_index do |letter, index|
      letters[index].upcase! if mask[index] == '1'
    end
  end

  def letters
    @letters ||= word.split(//)
  end
end

File.open(ARGV[0], "r").each_line { |line| puts StringUppercaseWithMask.new(line) }
