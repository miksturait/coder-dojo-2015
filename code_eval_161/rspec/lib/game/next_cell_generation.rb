class Game::NextCellGeneration < Struct.new(:current_state, :live_neighbours_count)
  def next_state
    if is_alive
      if two_alive || three_alive
        '*'
      else
        '.'
      end
    else
      if three_alive
        '*'
      else
        '.'
      end
    end
  end

  private

  def is_alive
    current_state == '*'
  end

  def two_alive
    live_neighbours_count == 2
  end

  def three_alive
    live_neighbours_count == 3
  end
end
