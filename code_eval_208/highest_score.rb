class HighScoreFinder < Struct.new(:line)
  def players_input
    line.split(" | ")
  end

  def scores_per_player
     players_input.map do |player_scores|
       player_scores.split(" ").map(&:to_i)
     end
  end

  def scores_per_category
    scores_per_player.transpose
  end

  def max_score_per_category
    scores_per_category.map(&:max)
  end

  def to_s
    max_score_per_category.join(' ')
  end

end

require '../support/process_file'
ProcessFile.new do |line|
  puts HighScoreFinder.new(line)
end
