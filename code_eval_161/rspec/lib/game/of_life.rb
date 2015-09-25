class Game::OfLife
  attr_accessor :generation_as_text

  def initialize(generation_as_text)
    @generation_as_text = generation_as_text.gsub(/\n/, '')
  end

  def display
    generation_as_text.split('').each_slice(dimension).with_object("") do |line, cache|
      cache << line.join('') << "\n"
    end
  end

  def next_generation
    self.generation_as_text =
        cell_iterator.with_object("") do |(cell, index), new_generation|
          new_generation << next_cell_state(cell, index)
        end
  end

  def generation(nth)
    nth.times { next_generation }
  end

  def next_cell_state(cell, index)
    live_neighbours = Game::Neighbours.new(index, generation_as_text, dimension).live_amount
    Game::NextCellGeneration.new(cell, live_neighbours).next_state
  end

  def cell_iterator
    generation_as_text.split('').each.with_index
  end

  def dimension
    @dimension ||= Math.sqrt(world_length).to_i
  end

  def world_length
    @world_length ||= generation_as_text.length
  end
end
