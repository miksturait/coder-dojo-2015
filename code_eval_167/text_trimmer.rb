require '../support/process_file'
class TextTrimmer
  attr_reader :line

  def initialize line
    @line=line
  end

  def to_s
    if line.length > 55
      text_trim.join(" ") << "... <Read More>"
    else
      line
    end
  end

  private

  def text_trim
    words.reduce([]) do |trimmed_text, word|
      if (word_length(trimmed_text) + word.length) < 40
        trimmed_text.push(word)
      else
        break trimmed_text
      end
    end
  end

  def words
    line.split(" ")
  end

  def word_length(trimmed_text)
    (trimmed_text.map(&:length).reduce(:+) || 0) + trimmed_text.size
  end
end

ProcessFile.new do |line|
  puts TextTrimmer.new(line)
  end
