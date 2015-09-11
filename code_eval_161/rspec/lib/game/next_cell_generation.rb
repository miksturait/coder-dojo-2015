class Game::NextCellGeneration < Struct.new(:current_state, :live_neighbours_count)
  def next_state
    if current_state == '*'
      if live_neighbours_count == 2 || live_neighbours_count == 3
        '*'
      else
        '.'
      end
    end
  end
end
