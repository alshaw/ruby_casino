require 'pry'
require_relative 'player'
require_relative 'wallet'

class Casino
  attr_accessor :players
  
  def initialize
    puts 'Welcome to the Ruby Casino'
    @player = Player.new
  end
end

Casino.new