class CleanupWords < Struct.new(:text)
  def to_s
    only_words
  end

  def only_words
    text.downcase.gsub(/[^a-z]+/, ' ').strip
  end
end

require '../support/process_file'
ProcessFile.new { |line| puts CleanupWords.new(line) }
