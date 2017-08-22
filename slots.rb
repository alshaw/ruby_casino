require 'pry'

#slot machine roll

class Slots
  attr_accessor :player
  
  @slot_cash = []

  
  def initialize(player)
    puts "Welcome to HOT SHOT Slots, #{player.name}!"
    puts 'Youll have to spin it to win it!'
    puts "You have #{player.wallet.amount} to bet with!"
    slot_menu(player)
  end
  
  def slot_menu(player)
    @slot_cash = player.wallet.amount
    puts 'place your bets, or walk away!'
    puts "Reminder: You have $#{player.wallet.amount} left."
    puts '1) Place bet'
    puts '2) Leave Slots'
    case gets.to_i
      when 1
        machine(player)
      when 2
        exit
      else
        puts 'Invalid choice! Try again!'
        slot_menu(player)       
    end
  end

  def machine(player)
    puts 'How much you betting?'

    puts '1) $1'
    puts '2) $5'
    puts '3) $10'
    puts '4) $20'
    puts '5) Nevermind, main menu'
    user_input = gets.to_i
    case user_input
      when 1
        if player.wallet.amount < 1
          puts 'Sorry! you dont have enough left to make that bet!'
          machine(player)
        end
          @bet = 1
      when 2
        if player.wallet.amount < 5
          puts 'Sorry! you dont have enough left to make that bet!'
          machine(player)
        end
          @bet = 5
      when 3
        if player.wallet.amount < 10
          puts 'Sorry! you dont have enough left to make that bet!'
          machine(player)
        end
          @bet = 10
      when 4
        if player.wallet.amount < 20
          puts 'Sorry! you dont have enough left to make that bet!'
          machine(player)
        end
          @bet = 20
      when 5
        slot_menu(player)
      else
        puts 'Invalid bet! Try again!'
        machine(player)
    end
    puts "Bets are in; Pull that lever!"
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
        puts 'You broke even!'
        player.wallet.amount = @slot_cash.to_i + @bet_result.to_i
        win(player)
      when [ 'bar', 'bar', 'bar' ]
        @bet_result = @bet * 2
        puts 'Doubled your dough! Well done!'
        player.wallet.amount = @slot_cash.to_i + @bet_result.to_i
        win(player)
      when [ 'dblbar', 'dblbar', 'dblbar']
        @bet_result = @bet * 5
        puts 'Your bet back times 5! Feelin alive?!'
        player.wallet.amount = @slot_cash.to_i + @bet_result.to_i
        win(player)
      when [ 'trplbar', 'trplbar', 'trplbar' ]
        @bet_result = @bet * 20
        puts 'You are on a roll! Bet some more!'
        player.wallet.amount = @slot_cash.to_i  + @bet_result.to_i 
        win(player)
      when [ 7, 7, 7 ]
        @bet_result = @bet * 65
        puts 'Big winner! Now keep at it for that jackpot!'
        player.wallet.amount = @slot_cash.to_i + @bet_result.to_i
        win(player)
      when [ 'jackpot', 'jackpot', 'jackpot' ]
        @bet_result = @bet * 100
        puts 'JACKPOT!'
        player.wallet.amount = @slot_cash.to_i + @bet_result.to_i
        win(player)
      else
        puts "#{@roller_results[0]} - #{@roller_results[1]} - #{@roller_results[2]}"
        puts 'Better luck next time dude!'
        player.wallet.amount = @slot_cash.to_i - @bet
        puts "You now have $#{player.wallet.amount} in your wallet"
        slot_menu(player)
      end
    machine(player)
  end

  def win(player)
    binding.pry
    puts "#{@roller_results[0]} - #{@roller_results[1]} - #{@roller_results[2]}"
    puts "You bet #{@bet}, and you won #{@bet_result}!!!"
    puts "You now have $#{player.wallet.amount} in your wallet"
    slot_menu(player)
  end
end
