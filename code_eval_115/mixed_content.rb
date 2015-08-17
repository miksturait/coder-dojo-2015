class MixedContent < Struct.new(:texts)
  def to_s
    collection.compact.map { |element| element.join(',') }.join('|')
  end

  private

  def collection
    [words, numbers].select { |collection| !collection.empty? }
  end

  def words
    texts - numbers
  end

  def numbers
    texts.select { |text| text =~ /\d/ }
  end
end

require '../support/process_file'
ProcessFile.new { |line| puts MixedContent.new(line.split(',')) }
