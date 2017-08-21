require 'pry'
require_relative 'player'
require_relative 'high_low'

class Casino
  attr_accessor :players
  
  def initialize
    puts 'Welcome to the Ruby Casino'
    @player = Player.new
    menu
  end

  def menu
    puts "1) Play HighLow"
    puts "2) Quit"
    case gets.to_i
      when 1 
        HighLow.new(@player)
      when 2 
        puts 'Thanks for playing'
        exit
      else
        puts 'Invalid Choice! Try again!'
        menu
    end
    menu
  end
end

Casino.new