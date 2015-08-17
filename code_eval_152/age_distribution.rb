class AgeDistribution < Struct.new(:age)
  DISTRIBUTION_MAP = {
      0..2 => "Still in Mama's arms",
      3..4 => "Preschool Maniac",
      5..11 => "Elementary school",
      12..14 => "Middle school",
      15..18 => "High school",
      19..22 => "College",
      23..65 => "Working for the man",
      66..100 => "The Golden Years"
  }
  NOT_DEFINED_RESCUE_RESPONSE = 'This program is for humans'

  def to_s
    category
  end

  def category
    detect_pair ? detect_pair.last : NOT_DEFINED_RESCUE_RESPONSE
  end

  private

  def detect_pair
    DISTRIBUTION_MAP.detect { |range, _| range.include?(age) }
  end
end

require '../support/process_file'
ProcessFile.new { |line| puts AgeDistribution.new(line.to_i) }



