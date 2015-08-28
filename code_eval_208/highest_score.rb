class HighScoreFinder < Struct.new(:line)
  def max_score_per_category
    scores_per_category.map(&:max)
  end

  def to_s
    max_score_per_category.join(' ')
  end

  private

  def scores_per_player_as_text
    line.split(" | ")
  end

  def scores_per_player
    scores_per_player_as_text.map do |player_scores|
      player_scores.split(" ").map(&:to_i)
    end
  end

  def scores_per_category
    scores_per_player.transpose
  end
end

require '../support/process_file'
ProcessFile.new do |line|
  puts HighScoreFinder.new(line)
end
