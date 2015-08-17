class CapitalizeWords < Struct.new(:words)
  def to_s
    capitalize_each_word.join(" ")
  end

  def capitalize_each_word
    words.map { |word| word[0].capitalize << word[1..-1] }
  end
end

require '../support/process_file'
ProcessFile.new { |line| puts CapitalizeWords.new(line.split) }
