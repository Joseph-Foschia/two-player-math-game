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

def calculateAnswer(player)
  num1 = rand(1..player.difficulty)
  num2 = rand(1..player.difficulty)
  player.difficulty *= 10
  answer = num1 + num2
  puts player.name + ": What does #{num1} plus #{num2} equal?"
  player_answer = gets.chomp
  player.calculateLives(player_answer, answer)
end

def checkIfPlayerLoses(currentPlayer, opponent, playerNum)
  if currentPlayer.lives == 0
    puts "Player #{playerNum} wins with a score of #{opponent.lives}/3"
  end
end
level = 1
p1 = Player.new('Player 1')
p2 = Player.new('Player 2')

while p1.lives != 0 && p2.lives != 0
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

  #Increases level count
  level += 1
  puts "----- DIFFICULTY: LEVEL #{level} -----"
end