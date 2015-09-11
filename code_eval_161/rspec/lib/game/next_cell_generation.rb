class Game::NextCellGeneration < Struct.new(:current_state, :live_neighbours_count)
  def next_state
    '.'
  end
end
