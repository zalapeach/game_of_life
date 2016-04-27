class Cell
  require 'pry'
  require_relative 'World'

  attr_accessor :alive, :alive_next_turn

  def initialize
    @alive = random_alive
    @alive_next_turn = nil
  end

  def random_alive
    [true, false].sample
  end

  def count_neighbors(world, row, col)
    neighbors = 0
    if world[row - 1][col - 1].alive && col - 1 >= 0 && row - 1 >= 0
      neighbors += 1
    end
    if world[row - 1][col].alive && row - 1 >= 0
      neighbors += 1
    end
    if !world[row - 1][col + 1].nil? && world[row - 1][col + 1].alive && row - 1 >= 0
      neighbors += 1
    end
    if world[row][col - 1].alive && col - 1 >= 0
      neighbors += 1
    end
    if !world[row][col + 1].nil? && world[row][col + 1].alive && col < world.size
      neighbors += 1
    end
    if row + 1 < world.size && col - 1 >= 0 && !world[row + 1][col - 1].nil? && world[row + 1][col -1].alive
      neighbors += 1
    end
    if row + 1 < world.size && !world[row + 1][col].nil? && world[row + 1][col].alive
      neighbors += 1
    end
    if row + 1 < world.size && col + 1 < world.size && !world[row + 1][col + 1].nil? && world[row + 1][col + 1].alive
      neighbors += 1
    end
    rules(neighbors)
  end

  def rules(neighbors)
    if (@alive && neighbors < 2) || (@alive && neighbors > 3)
      @alive_next_turn = false
    elsif (@alive && neighbors >= 2) || (@alive && neighbors <= 3)
      @alive_next_turn = true
    elsif !@alive && neighbors == 3
      @alive_next_turn = true
    else
      @alive_next_turn = false
    end
  end

  def tick!
    @alive = @alive_next_turn
    @alive_next_turn = nil
  end
end
