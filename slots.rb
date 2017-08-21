#slot machine roll
class Slots

  @chances = [ 'cherry', 'cherry', 'bar', 'bar', 'bar', 'bar', 'bar',
    7, 7, 7, 7, 7, 7, 7, 7, 'cherry', 'cherry', 
    'dblbar', 'dblbar', 'dblbar', 'dblbar', 'dblbar', 'dblbar', 'dblbar', 
    'cherry', 'dblbar', 'dblbar', 'dblbar', 'dblbar', 'dblbar', 'dblbar',
    'bar', 'bar', 'bar', 'bar', 'bar', 'bar',
    'trplbar', 'trplbar', 'trplbar', 'trplbar', 'trplbar', 'trplbar',
    'trplbar', 'trplbar', 'trplbar', 'trplbar', 'trplbar', 
    'jackpot', 'jackpot', 
  ]

  def slot_menu
    puts 'place your bets, or walk away!'
    puts '1) Place bet'
    puts '2) Leave Slots'
    case gets.to_i
      when 1
        machine
      when 2
      else
        puts 'Invalid choice! Try again!'
        slot_menu
    end
  end

  def machine
    puts 'How much you betting?'
    puts "Reminder: You have #{@slot_cash} left."
    puts '1) $5'
    puts '2) $10'
    puts '3) $20'
    user_input = gets.to_i
    case user_input
      when 1
        if @slot_cash < 5
          puts 'Sorry! you dont have enough left to make that bet!'
          machine
        end
        @bet = 5
      when 2
        if @slot_cash < 10
          puts 'Sorry! you dont have enough left to make that bet!'
          machine
        end
        @bet = 10
      when 3
        if @slot_cash < 20
          puts 'Sorry! you dont have enough left to make that bet!'
          machine
        end
        @bet = 20
      else
        puts 'Invalid bet! Try again!'
        machine
    end
    puts "Bets are in; Pull that lever!"
  end

  def initialize(player)
    puts 'Welcome to HOT SHOT Slots!'
    puts 'Youll have to spin it to win it!'
    puts "Welcome to High Low #{player.name}"
    puts "You have #{player.wallet.amount} to bet with!"
    @slot_cash = player.wallet.amount
    binding.pry
    slot_menu
  end

  def machine
    puts 'How much you betting?'
    puts "Reminder: You have #{@slot_cash} left."
    puts '1) $5'
    puts '2) $10'
    puts '3) $20'
    user_input = gets.to_i
    case user_input
      when 1
        if @slot_cash < 5
          puts 'Sorry! you dont have enough left to make that bet!'
          machine
        end
        @bet = 5
      when 2
        if @slot_cash < 10
          puts 'Sorry! you dont have enough left to make that bet!'
          machine
        end
        @bet = 10
      when 3
        if @slot_cash < 20
          puts 'Sorry! you dont have enough left to make that bet!'
          machine
        end
        @bet = 20
      else
        puts 'Invalid bet! Try again!'
        machine
    end
    puts "Bets are in; Pull that lever!"
  end
end