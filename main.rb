require './helpers/helper'
require 'timeout'

class Player

  attr_accessor :name, :lives, :difficulty

  def initialize(name)
    @name = name
    @lives = 3
    @difficulty = 10
  end

  def calculateLives(playersAnswer, answer)
    puts "The answer is: #{answer}"
    if playersAnswer.to_i != answer
      @lives -= 1
      puts "You are wrong!"
    else
      puts "You are correct!"
    end
  end

end
level = 1
p1 = Player.new('Player 1')
p2 = Player.new('Player 2')

while p1.lives != 0 && p2.lives != 0

  #Increases level count
  puts "----- DIFFICULTY: LEVEL #{level} -----"
  level += 1
  
  #Player 1's turn!
  calculateAnswer(p1)

  puts "P1: #{p1.lives}/3 "
  
  checkIfPlayerLoses(p1, p2, 2)
  
  break if p1.lives == 0
  
  puts "----- NEW TURN -----"
  #Player 2's turn!
  calculateAnswer(p2)
  puts "P2: #{p2.lives}/3 "
  checkIfPlayerLoses(p2, p1, 1)
end

#Timer, imports