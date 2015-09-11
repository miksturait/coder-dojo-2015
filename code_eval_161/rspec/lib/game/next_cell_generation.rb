class Game::NextCellGeneration < Struct.new(:current_state, :live_neighbours_count)
  LIVE = '*'
  DEAD = '.'

  def next_state
    (is_alive? ? should_alive? : should_reborn?) ? LIVE : DEAD
  end

  private

  def should_alive?
    two_alive? || three_alive?
  end

  def should_reborn?
    three_alive?
  end

  def is_alive?
    current_state == LIVE
  end

  def two_alive?
    live_neighbours_count == 2
  end

  def three_alive?
    live_neighbours_count == 3
  end
end
