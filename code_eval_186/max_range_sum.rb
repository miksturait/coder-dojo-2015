class MaxRangeSum < Struct.new(:days_frame, :gain_and_losses)
  def to_s
    max_gain.to_s
  end

  def max_gain
    (input_valid? && (maximum > 0)) ? maximum : 0
  end

  private

  def maximum
    @maximum ||= gain_or_loss_within_days_frame.max
  end

  def gain_or_loss_within_days_frame
    starting_days.map do |starting_day|
      gain_and_losses.slice(starting_day, days_frame).reduce(:+)
    end
  end

  def starting_days
    0..last_starting_day
  end

  def last_starting_day
    number_of_samples-days_frame
  end

  def input_valid?
    number_of_samples >= days_frame && days_frame != 0
  end

  def number_of_samples
    gain_and_losses.size
  end
end

require '../support/process_file'
ProcessFile.new do |line|
  input = line.split(/;|\s/).map(&:to_i)
  puts MaxRangeSum.new(input.shift, input)
end
