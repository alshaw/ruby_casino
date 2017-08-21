require 'pry'

class HighLow
  attr_accessor :bet_amount, :player_count, :bet_won

  def initialize(player)
    @player = player
    @player_count = 0
    puts "Welcome to High Low #{player.name}"
    puts "You have #{player.wallet.amount} to bet with!"
    puts "1)To play High Low\n2)To read the rules\n3)Exit to menu"
    choice = gets.to_i
    case choice
    when 1 
      bet
    when 2
      rules
    when 3
      exit
    
    else 
      puts "Invalid input. Please enter a valid number!"
      HighLow.new(@player)
    end
  end

    def rules 
      puts "You will be given a random number 1 through 10. You must then guess if the next number will be higher or lower. You must guess correctly to win."
      puts "Press 1 to play game."
      choice = gets.to_i
      if choice == 1
        bet
      else
        puts "Invalid, please try again."
      end
    end

    def bet
      puts "How much would you like to bet?"
      @bet_amount = gets.to_f
      if @bet_amount > @player.wallet.amount
        puts "Sorry, you do not have that much money in your wallet. Try a lower bet."
        bet
      end
      puts "You have chosen to bet $#{bet_amount}."
      puts "Is this correct?\n1)Yes\n2)No"
      input = gets.to_i
      if input == 1
        game_method
      elsif input == 2
        puts "Please try again."
        bet
      else
        puts "Invalid input. Please try again."
        bet
      end
    end

    def game_method
      @bet_won = @bet_amount * 2 
      numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
      a = numbers.sample
      b = numbers.sample
      if(@player_count < 1)
        puts "The high number is #{numbers.last} and the low is #{numbers.first}\nThe first number is..."
        puts "#{a}\n1)Higher\n2)Lower"
        input = gets.to_i
        if a < b
          if input == 1
            puts "Congratulations! Your number is #{b}."
            @player_count += 1
            game_method
          else
            puts "Sorry, your number is #{b}."
            puts "You have lost #{bet_amount}."
            @player.wallet.amount -= @bet_amount
            HighLow.new(@player)
          end
        end
        if a > b
          if input == 2
            puts "Congratulations! Your mnumber is #{b}."
            @player_count += 1
            game_method
          else
            puts "Sorry, your number is #{b}."
            puts "You have lost #{bet_amount}."
            @player.wallet.amount -= @bet_amount
            HighLow.new(@player)
          end
        end
        puts "Congratulations! You have won #{@bet_won}."
        @player.wallet.amount += @bet_won
        puts "1)Play again\n2)Exit to the menu."
        user_input = gets.to_i
        case user_input
        when 1
          HighLow.new(@player)
        when 2
          puts "Thanks for playing!"
        end
      end
    #ask the player for their bet
    #error checking so the player can't bet with more than they have
    #play the game
    #add or subtract from the players wallet after the game
    #allow them to play again or go back to the main menu
  end
end
