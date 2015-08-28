
class ProcessFile
  def initialize(filename = ARGV[0])
    @filename = filename
     yield(file_body())
  end

  private

  def file_body()
    File.open(@filename, "r").read
  end
end

ProcessFile.new do |generation_as_text|
   puts generation_as_text
end
