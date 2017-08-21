require 'pry'
require_relative 'player'
require_relative 'high_low'
require_relative 'head_tails'
require_relative 'wallet'

class Casino
  attr_accessor :player
  
  def initialize
    puts 'Welcome to the Ruby Casino'
    @player = Player.new
    menu
  end

  def menu
    puts "1) Play HighLow"
    puts "2) Play Heads or Tails"
    puts "3) Play Black Jack"
    puts "4) Slots"
    puts "5) Check Balance"
    puts "6) Quit"
    case gets.to_i
      when 1 
        HighLow.new(@player)
      when 2
        HeadsTails.new(@player)
      when 3 
        BlackJack.new(@player)
      when 4 
        Slots.new(@player)
      # Not linking to wallet
      # when 4
      #   Wallet.new(@amount)
      when 6
        puts 'Thanks for playing'
        exit
      else
        puts 'Invalid Choice! Try again!'
        menu
      binding.pry
    end
    menu
  end
end

Casino.new