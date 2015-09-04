class Game::Neighbours < Struct.new(:coordinate, :word_size)
  def reachable
    []
  end
end
