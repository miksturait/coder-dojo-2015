class ProcessFile
  def initialize(filename = ARGV[0])
    File.open(filename, "r").each_line { |line| yield(line) }
  end
end
