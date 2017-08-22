require 'pry'
require 'Colorize'


#slot machine roll

class Slots
  attr_accessor :player
  
  @slot_cash = []
 def initialize(player)
    puts '$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'.colorize(:yellow)
    puts ' /$$   /$$           /$$            /$$$$$$ /$$                 /$$    '.colorize(:yellow)
    puts '| $$  | $$          | $$           /$$__  $| $$                | $$    '.colorize(:yellow)
    puts '| $$  | $$ /$$$$$$ /$$$$$$        | $$  \__| $$$$$$$  /$$$$$$ /$$$$$$  '.colorize(:yellow)
    puts '| $$$$$$$$/$$__  $|_  $$_/        |  $$$$$$| $$__  $$/$$__  $|_  $$_/  '.colorize(:yellow)
    puts '| $$__  $| $$  \ $$ | $$           \____  $| $$  \ $| $$  \ $$ | $$    '.colorize(:yellow)
    puts '| $$  | $| $$  | $$ | $$ /$$       /$$  \ $| $$  | $| $$  | $$ | $$ /$$'.colorize(:yellow)
    puts '| $$  | $|  $$$$$$/ |  $$$$/      |  $$$$$$| $$  | $|  $$$$$$/ |  $$$$/'.colorize(:yellow)
    puts '|__/  |__/\______/   \___/         \______/|__/  |__/\______/   \___/  '.colorize(:yellow)
    puts '               /$$$$$$ /$$           /$$            /$$                '.colorize(:yellow)
    puts '              /$$__  $| $$          | $$           | $$                '.colorize(:yellow)
    puts '             | $$  \__| $$ /$$$$$$ /$$$$$$  /$$$$$$| $$                '.colorize(:yellow)
    puts '             |  $$$$$$| $$/$$__  $|_  $$_/ /$$_____| $$                '.colorize(:yellow)
    puts '              \____  $| $| $$  \ $$ | $$  |  $$$$$$|__/                '.colorize(:yellow)
    puts '              /$$  \ $| $| $$  | $$ | $$ /$\____  $$                   '.colorize(:yellow)
    puts '             |  $$$$$$| $|  $$$$$$/ |  $$$$/$$$$$$$//$$                '.colorize(:yellow)
    puts '             \______/|__/\______/   \___/|_______/|__/                 '.colorize(:yellow)
    puts '$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'.colorize(:yellow)
    puts ''
    puts "Welcome to HOT SHOT Slots, #{player.name}!".colorize(:yellow)
    puts 'Youll have to spin it to win it!'.colorize(:yellow)
    slot_menu(player)
  end
  
  def slot_menu(player)
    @slot_cash = player.wallet.amount
    puts 'place your bets, or walk away!'.colorize(:yellow)
    puts "Reminder: You have $#{player.wallet.amount} to bet with.".colorize(:green)
    puts '1) Place bet'.colorize(:yellow)
    puts '2) Leave Slots'.colorize(:red)
    case gets.to_i
      when 1
        machine(player)
      when 2
        puts "Thanks for playing slots!".colorize(:yellow)
      else
        puts 'Invalid choice! Try again!'.colorize(:red)
        slot_menu(player)       
    end
  end

  def machine(player)
    puts 'How much would you like to bet?'.colorize(:yellow)

    puts '1) $1'.colorize(:green)
    puts '2) $5'.colorize(:green)
    puts '3) $10'.colorize(:green)
    puts '4) $20'.colorize(:green)
    puts '5) Nevermind, main menu'.colorize(:yellow)
    user_input = gets.to_i
    case user_input
      when 1
        if player.wallet.amount < 1
          puts 'Sorry! you dont have enough left to make that bet!'.colorize(:red)
          machine(player)
        end
          @bet = 1
      when 2
        if player.wallet.amount < 5
          puts 'Sorry! you dont have enough left to make that bet!'.colorize(:red)
          machine(player)
        end
          @bet = 5
      when 3
        if player.wallet.amount < 10
          puts 'Sorry! you dont have enough left to make that bet!'.colorize(:red)
          machine(player)
        end
          @bet = 10
      when 4
        if player.wallet.amount < 20
          puts 'Sorry! you dont have enough left to make that bet!'.colorize(:red)
          machine(player)
        end
          @bet = 20
      when 5
        slot_menu(player)
      else
        puts 'Invalid bet! Try again!'.colorize(:red)
        machine(player)
    end
    puts "Bets are in; Pull that lever!".colorize(:cyan)
    roll(player)
  end

  
  def roll(player)
    @chances = [ 'cherry', 'cherry', 'bar', 'bar', 'bar', 'bar', 'bar', 7, 7, 7, 7, 7, 7, 7, 7, 'dblbar', 'dblbar', 
    'dblbar', 'dblbar', 'dblbar', 'dblbar', 'dblbar', 'dblbar', 'dblbar', 'dblbar', 'dblbar', 'dblbar', 'dblbar', 
    'bar', 'bar', 'bar', 'bar', 'bar', 'bar', 'trplbar', 'trplbar', 'trplbar', 'trplbar', 'trplbar', 'trplbar', 
    'trplbar', 'trplbar', 'trplbar', 'trplbar', 'trplbar', 'jackpot', 'jackpot' ] 

    @roller_results = []
    @roller_results << @chances.sample
    @roller_results << @chances.sample
    @roller_results << @chances.sample
    case @roller_results
      when [ 'cherry', 'cherry', 'cherry' ]
        @bet_result = @bet
        puts 'You broke even!'.colorize(:green)
        player.wallet.amount = @slot_cash.to_i + @bet_result.to_i
        win(player)
      when [ 'bar', 'bar', 'bar' ]
        @bet_result = @bet * 2
        puts 'Doubled your dough! Well done!'.colorize(:green)
        player.wallet.amount = @slot_cash.to_i + @bet_result.to_i
        win(player)
      when [ 'dblbar', 'dblbar', 'dblbar']
        @bet_result = @bet * 5
        puts 'Your bet back times 5! Feelin alive?!'.colorize(:green)
        player.wallet.amount = @slot_cash.to_i + @bet_result.to_i
        win(player)
      when [ 'trplbar', 'trplbar', 'trplbar' ]
        @bet_result = @bet * 20
        puts 'You are on a roll! Bet some more!'.colorize(:green)
        player.wallet.amount = @slot_cash.to_i  + @bet_result.to_i 
        win(player)
      when [ 7, 7, 7 ]
        @bet_result = @bet * 65
        puts 'Big winner! Now keep at it for that jackpot!'.colorize(:green)
        player.wallet.amount = @slot_cash.to_i + @bet_result.to_i
        win(player)
      when [ 'jackpot', 'jackpot', 'jackpot' ]
        @bet_result = @bet * 100
        puts 'JACKPOT!'.colorize(:green)
        player.wallet.amount = @slot_cash.to_i + @bet_result.to_i
        win(player)
      else
        puts "#{@roller_results[0]} - #{@roller_results[1]} - #{@roller_results[2]}"
        puts 'Better luck next time. Why not go again!?'.colorize(:yellow)
        player.wallet.amount = @slot_cash.to_i - @bet
        puts "You now have $#{player.wallet.amount} in your wallet".colorize(:green)
        slot_menu(player)
      end
    machine(player)
  end

  def win(player)
    puts ' __ __ __   _     _ ___ __    _ __    _ _______ ______     __ __ __  '.colorize(:green)
    puts '|  |  |  | | | _ | |   |  |  | |  |  | |       |    _ |   |  |  |  | '.colorize(:green)
    puts '|  |  |  | | || || |   |   |_| |   |_| |    ___|   | ||   |  |  |  | '.colorize(:green)
    puts '|  |  |  | |       |   |       |       |   |___|   |_||_  |  |  |  | '.colorize(:green)
    puts '|__|__|__| |       |   |  _    |  _    |    ___|    __  | |__|__|__| '.colorize(:green)
    puts ' __ __ __  |   _   |   | | |   | | |   |   |___|   |  | |  __ __ __  '.colorize(:green)
    puts '|__|__|__| |__| |__|___|_|  |__|_|  |__|_______|___|  |_| |__|__|__| '.colorize(:green)
    puts "#{@roller_results[0]} - #{@roller_results[1]} - #{@roller_results[2]}".colorize(:green)
    puts "You bet #{@bet}, and you won #{@bet_result}!!!".colorize(:green)
    puts "You now have $#{player.wallet.amount} in your wallet".colorize(:green)
    slot_menu(player)
  end
end
