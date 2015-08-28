require '../support/process_file'
ProcessFile.new do |line|
  puts (line.
           split(" | ").
           map {|player_scores| player_scores.split(" ").map(&:to_i)}.
           transpose.
           map(&:max).
           join(" ")    )
end
