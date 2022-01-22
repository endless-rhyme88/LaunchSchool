VALID_CHOICES = {
  'rock' => %w[lizard scissors],
  'paper' => %w[rock spock],
  'scissors' => %w[paper lizard],
  'lizard' => %w[paper spock],
  'spock' => %w[rock scissors]
}

def print_matchups
  puts <<-MSG
            
            BEATS:                  LOSES TO:
  ROCK     =>  SCISSORS and LIZARD |  SPOCK and PAPER
  
  PAPER    =>  ROCK and SPOCK      |  SCISSORS and LIZARD
  
  SCISSORS =>  PAPER and LIZARD    |  ROCK and SPOCK
  
  LIZARD   =>  PAPER and SPOCK     |  SCISSORS and ROCK
  
  SPOCK    =>  ROCK and SCISSORS   |  PAPER and LIZARD
  MSG
end

def grand_winner(player_score, computer_score)
  if player_score == 3
    prompt("The grand winner is the player!!")
  elsif computer_score == 3
    prompt("The grand winner is the computer!!")
  end
end

def win?(a, b)
  a.values[0].include?(b.keys[0])
end

def update_score(player, computer, scores)
  if win?(player, computer)
    scores[:player] += 1
  elsif win?(computer, player)
    scores[:computer] += 1
  end
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("ROCK!! PAPER!!: #{player.keys[0]} vs #{computer.keys[0]} You won!")
  elsif win?(computer, player)
    prompt("ROCK!! PAPER!!: #{player.keys[0]} vs #{computer.keys[0]}" \
    " Computer wins!")
  else
    prompt("ROCK!! PAPER!!: #{player.keys[0]} vs #{computer.keys[0]}" \
    " It's a tie!")
  end
end

def special_hint(computer_score, computer_choice)
  if computer_score == 2
    prompt("PSST!! Need a hand? I got some intel you may find useful.")
    loop do
      print "(Press Y or N): "
      confirm_choice = player_input()
      if confirm_choice == 'N'
        clear_prompt()
        break
      elsif confirm_choice == 'Y'
        clear_prompt()
        puts "Downloading Intel...."
        sleep(1)
        clear_prompt()
        prompt("The COMPUTER equipped: '#{computer_choice.keys[0]}!!'" \
        " Good luck!")
        break
      else
        prompt("Invalid input")
      end
    end
  end
end

def help_menu
  clear_prompt()
  print_matchups
  loop do
    print '(Press L to leave):'
    confirm_choice = player_input
    if confirm_choice == 'L'
      clear_prompt()
      break
    else
      prompt("Invalid input")
    end
  end
end

def weapon_assignment(player)
  VALID_CHOICES.select { |k, _| k.capitalize.match?(player) }
end

def clear_prompt
  system "clear"
end

def prompt(message)
  puts ">> #{message.strip}"
end

def player_input
  gets.chomp.capitalize
end

# MAIN CODE HERE

prompt("Welcome to Rock, Paper, Spock. the first to 3 wins The match..")

loop do
  prompt('It plays just like regular Rock Paper Scissors,' \
  'do know the match ups?')
  print '(Press Y or N): '
  confirm_choice = player_input()
  if confirm_choice == 'Y' || confirm_choice == 'Yes'
    clear_prompt
    break
  elsif confirm_choice == 'N' || confirm_choice == 'No'
    help_menu()
  else
    prompt('Invalid input')
  end
end

prompt("choose your weapon:")

computer_choice = ''
player_choice = ''
scores = { player: 0, computer: 0 }
round_num = 0

loop do
  until scores[:computer] == 3 || scores[:player] == 3

    computer_choice = VALID_CHOICES.to_a.sample(1).to_h
    confirm_choice = ''
    special_hint(scores[:computer], computer_choice)
    prompt("PLAYER: #{scores[:player]}, COMPUTER: #{scores[:computer]}")
    prompt("ROUND: #{round_num + 1}!!")
    loop do
      loop do
        puts <<-MSG
          Press the letter corresponding to your weapon choice
          R)   = rock
          P)   = paper
          SC)  = scissors
          L)   = lizard
          SP)  = spock
                            press  M) for Matchups
        MSG
        print 'I equip: '
        player_choice = player_input()
        if %w[R P Sc L Sp Rock Paper Scissors Lizard Spock].include?(player_choice)
          player_choice = weapon_assignment(player_choice)
          break
        elsif player_choice == 'M'
          help_menu()
        else
          clear_prompt()
          prompt('Invalid input')
        end
      end

      clear_prompt()

      prompt("The path of #{player_choice.keys[0]}, is the path you choose?")

      confirm_choice = ''
      loop do
        print "(Press Y or N): "
        confirm_choice = player_input()
        if confirm_choice == 'Y' || confirm_choice == 'Yes'
          break
        elsif confirm_choice == 'N' || confirm_choice == 'No'
          break
        else
          prompt("Invalid input")
        end
      end
      clear_prompt()
      break unless confirm_choice == 'N' || confirm_choice == 'No'
    end

    clear_prompt()
    puts "Processing..."
    sleep(0.99)
    clear_prompt()
    display_results(player_choice, computer_choice)
    round_num += 1
    update_score(player_choice, computer_choice, scores)
    grand_winner(scores[:player], scores[:computer])
  end

  prompt("Wanna play again?")
  play_again = ''
  loop do
    print '(Press Y or N): '
    play_again = player_input()
    if play_again == 'N' || play_again == 'No'
      puts "Hope you had fun! :)"
      break
    elsif play_again == 'Y' || play_again == 'Yes'
      scores[:player] = 0
      scores[:computer] = 0
      round_num = 0
      break
    else
      prompt("Invalid input")
    end
  end
  break unless play_again == 'Y' || play_again == 'Yes'
  clear_prompt()
  puts "Resetting.."
  sleep(0.99)
  clear_prompt()
end
