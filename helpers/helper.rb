#Generates and calculates a random answer, gets harder every time it is run!
def calculateAnswer(player)
  num1 = rand(1..player.difficulty)
  num2 = rand(1..player.difficulty)
  player.difficulty *= 10
  answer = num1 + num2
  puts player.name + ": What does #{num1} plus #{num2} equal?  You have 10 seconds!"
  begin
    Timeout.timeout(10) do
      player_answer = gets.chomp
      return player_answer
    end
  rescue Timeout::Error
    puts "Time's up!"
  end
  player_answer = 0
  player.calculateLives(player_answer, answer)
end

#Checks if the player loses and gives the appropriate message
def checkIfPlayerLoses(currentPlayer, opponent, playerNum)
  if currentPlayer.lives == 0
    puts "Player #{playerNum} wins with a score of #{opponent.lives}/3"
  end
end