require_relative 'wallet'

class Player
  attr_accessor :name, :age, :wallet

  def initialize
    puts "What is your name, player?"
    @name = gets.strip
    puts "What is your age #{@name}?"
    @age = gets.to_i
    if @age < 21
      puts "Sorry #{@name}, you need to be atleast 21 to enter."
      exit
    end
    puts "How much money are you playing with #{@name}"
    amount = gets.to_f
    if amount < 1
      puts "Please enter a valid amount."
      Player.new
    end
    @wallet = Wallet.new(amount)
  end
end
