class Game
  require 'pry'
  require_relative 'Cell'
  require_relative 'World'

  attr_accessor :world

  def initialize
    @world = World.new
  end

  def start
    system 'clear'
    @world.to_s
    @world.cell_alive_next_turn
    @world.update
    sleep 1
    start
  end
end
