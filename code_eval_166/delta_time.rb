class DeltaTime

  def initialize(line)
    @line = line
  end

  def to_s
    seconds_to_time(delta())
  end

  def time_to_seconds(time)
    hour, minute, second = time.split(':').map(&:to_i)
    time = hour*3600 + minute * 60 + second
  end

  def seconds_to_time(seconds)
    hour = seconds / 3600
    minutes = (seconds % 3600) / 60
    seconds = (seconds % 3600) % 60
    time = "#{hour.to_s.rjust(2,'0')}:#{minutes.to_s.rjust(2,'0')}:#{seconds.to_s.rjust(2,'0')}"
  end

  def first_time()
    time_to_seconds(@line.split(' ')[0])
  end

  def second_time()
    time_to_seconds(@line.split(' ')[1])
  end

  def delta()
    (first_time()-second_time()).abs

  end
end

require '../support/process_file'
ProcessFile.new do |line|
  puts DeltaTime.new(line)
end
