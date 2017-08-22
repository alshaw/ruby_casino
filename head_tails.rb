require 'pry'
require 'colorize'
# require_relative 'casino'

class HeadsTails
  attr_accessor :bet_amount, :casino, :player

 
  def initialize(player)
    puts " /$$   /$$                           /$$                                           /$$$$$$$$        /$$ /$$          
          | $$  | $$                          | $$                                          |__  $$__/       |__/| $$          
          | $$  | $$  /$$$$$$   /$$$$$$   /$$$$$$$  /$$$$$$$        /$$$$$$   /$$$$$$          | $$  /$$$$$$  /$$| $$  /$$$$$$$
          | $$$$$$$$ /$$__  $$ |____  $$ /$$__  $$ /$$_____/       /$$__  $$ /$$__  $$         | $$ |____  $$| $$| $$ /$$_____/
          | $$__  $$| $$$$$$$$  /$$$$$$$| $$  | $$|  $$$$$$       | $$  \ $$| $$  \__/         | $$  /$$$$$$$| $$| $$|  $$$$$$ 
          | $$  | $$| $$_____/ /$$__  $$| $$  | $$ \____  $$      | $$  | $$| $$               | $$ /$$__  $$| $$| $$ \____  $$
          | $$  | $$|  $$$$$$$|  $$$$$$$|  $$$$$$$ /$$$$$$$/      |  $$$$$$/| $$               | $$|  $$$$$$$| $$| $$ /$$$$$$$/
          |__/  |__/ \_______/ \_______/ \_______/|_______/        \______/ |__/               |__/ \_______/|__/|__/|_______/ 
          "
    puts "You have $#{player.wallet.amount} to bet with."
    puts "In heads or tails you will be betting on a coin flip."
  gamble
  end

  def gamble
    puts "How much would you like to bet?"
    @bet_amount = gets.to_i
    # if @bet_amount > @wallet.amount
    #     puts "Sorry, you do not have that much money in your wallet." 
    #     puts "Try a lower bet."
    #     gamble
    # end
    puts "Okay the bet is: #{@bet_amount}."
    puts "Heads or tails?"
    @choice = gets.strip.downcase
    flip
  end

  # coin flip method
  def flip
    puts "Here goes the flip!"
    options = ['Heads', 'Tails']
    puts "Dun Dun Dun...".colorize(:yellow)
    chance = options.sample.downcase
    puts chance.upcase.colorize(:magenta)  
    case
      when @choice == chance
        puts "Congratulations, you win #{@bet_amount * 2} dollars!"
        # @wallet.amount += @bet_amount
      else
        puts "Sorry, you lost #{@bet_amount} dollars. Try again!"
        # @wallet.amount -= @bet_amount
      end
    retry_menu
  end

  def retry_menu
    puts "Would you like to play again?"
    puts "1) Yes"
    puts "2) Exit"
     
    user_input = gets.to_i
    case user_input
      when 1
      gamble
      when 2
      Casino.new
  
    end
  end
end