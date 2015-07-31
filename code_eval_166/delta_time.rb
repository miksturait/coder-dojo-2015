DeltaTime = Struct.new(:start, :finish) do
  def to_s
    seconds_to_time(delta())
  end

  SECONDS_IN_HOUR = 3600

  SECONDS_IN_MINUTE = 60

  def time_to_seconds(time)
    hour, minute, second = time.split(':').map(&:to_i)
    hour*SECONDS_IN_HOUR + minute * SECONDS_IN_MINUTE + second
  end

  def seconds_to_time(second)
    format_time(second / SECONDS_IN_HOUR,
                (second % SECONDS_IN_HOUR) / SECONDS_IN_MINUTE,
                (second % SECONDS_IN_HOUR) % SECONDS_IN_MINUTE)
  end

  def format_time(hour, minutes, seconds)
    [hour, minutes, seconds].map {|number| number.to_s.rjust(2, '0') }.join(':')
  end

  def first_time()
    time_to_seconds(start)
  end

  def second_time()
    time_to_seconds(finish)
  end

  def delta()
    (first_time()-second_time()).abs

  end
end

require '../support/process_file'
ProcessFile.new do |line|
  puts DeltaTime.new(*line.split(' '))
end
