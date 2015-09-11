class Game::NextCellGeneration < Struct.new(:current_state, :live_neighbours_count)
  LIVE = '*'
  DEAD = '.'

  def next_state
    if is_alive
      should_alive? ? LIVE : DEAD
    else
      should_reborn? ? LIVE : DEAD
    end
  end

  private

  def should_alive?
    two_alive || should_reborn?
  end

  def is_alive
    current_state == LIVE
  end

  def two_alive
    live_neighbours_count == 2
  end

  def should_reborn?
    live_neighbours_count == 3
  end
end
