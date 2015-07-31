DeltaTime = Struct.new(:start, :finish) do
  def to_s
    (OurTime.parse(start) - OurTime.parse(finish)).to_s
  end

  class OurTime < Struct.new(:hour, :minute, :second)
    SECONDS_IN_HOUR = 3600
    SECONDS_IN_MINUTE = 60

    def self.new_from_seconds(second)
      new(second / SECONDS_IN_HOUR,
          (second % SECONDS_IN_HOUR) / SECONDS_IN_MINUTE,
          (second % SECONDS_IN_HOUR) % SECONDS_IN_MINUTE)
    end

    def self.parse(time)
        new(*time.split(':').map(&:to_i))
    end

    def -(other_time)
      self.class.new_from_seconds (to_i - other_time.to_i).abs
    end

    def to_s
      [hour, minute, second].map { |number| number.to_s.rjust(2, '0') }.join(':')
    end

    def to_i
      hour*SECONDS_IN_HOUR + minute * SECONDS_IN_MINUTE + second
    end
  end
end

require '../support/process_file'
ProcessFile.new do |line|
  puts DeltaTime.new(*line.split(' '))
end
