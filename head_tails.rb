require 'pry'
require 'colorize'
require_relative 'player'

class HeadsTails
  attr_accessor :player, :wallet

 
  def initialize(player)
    puts "Welcome to Heads or Tails #{player.name}!"
    puts "You have $#{player.wallet.amount} to bet with."
    puts "In heads or tails you will be betting on a coin flip."
    gamble
  end

  def gamble
    puts "How much would you like to bet?"
    bet_amount = gets.to_i
    #Will not call back to wallet amount
    # if bet > @player.wallet.amount
    #     puts "Sorry, you do not have enough money in your wallet."
    # end
    puts "Okay the bet is: #{bet_amount}."
    puts "Heads or tails?"
    choice = gets.strip

    flip
  end

  # coin flip method
  def flip
    puts "Here goes the flip!"
    chance = rand(1..2)
    puts "Dun Dun 'Dun..."  
    if chance == 1
        puts "Heads!".colorize(:blue)
      elsif chance == 2
        puts "Tails!".colorize(:red)
      else
        "OH HI"
    end   
    retry_menu
  end

  def retry_menu
    puts "Would you like to play again?"
    puts "1) Yes"
    puts "2) Exit"
    # choice_2 = gets.strip
    if gets.strip == 1
      gamble
    elsif gets.strip == 2
      exit
    end
  end
end