class World
  require 'pry'
  require_relative 'Cell'

  attr_accessor :world

  def initialize
    @world = Array.new(25) { Array.new(25) }
    populate_world
  end

  def populate_world
    @world.size.times do |row_index|
      @world[row_index].size.times do |col_index|
        @world[row_index][col_index] = Cell.new
      end
    end
  end

  def cell_alive_next_turn
    @world.each_with_index do |row, row_index|
      row.each_with_index do |cell, col_index|
        cell.count_neighbors(@world, row_index, col_index)
      end
    end
  end

  def update
    @world.each do |row|
      row.each { |cell| cell.tick! }
    end
  end

  def to_s
    @world.each do |cel|
      cel.each do |col|
        if col.alive
          print '*'
        else
          print ' '
        end
      end
      puts
    end
  end
end
