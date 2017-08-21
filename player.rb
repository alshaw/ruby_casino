require_relative 'wallet'

class Player
  attr_accessor :name, :age, :wallet

  def initialize
    puts "What is your name, player?"
    @name = gets.strip
    puts "What is your age #{@name}?"
    @age = gets.to_i
    puts "How much money are you playing with #{@name}"
    @wallet = Wallet.new(gets.to_f)
  end
end
