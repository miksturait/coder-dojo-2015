text = "Two thousand verses is a great many - very, very great many."
class TextTrimmer
  attr_reader :line

  def initialize line
    @line=line
  end

  def text_trim
    if line.length > 55
      trimmed_text = []
      collect_text(line, trimmed_text)
      trimmed_text.join(" ") << "... <Read More>"
    else
      line
    end
  end

  def word_length(trimmed_text)
    (trimmed_text.map(&:length).reduce(:+) || 0) + trimmed_text.size
  end

  def collect_text(text, trimmed_text)
    text.split(" ").each do |word|
      if (word_length(trimmed_text) + word.length) < 40
        trimmed_text.push(word)
      else
        break
      end
    end
  end
end

puts TextTrimmer.new(text).text_trim
