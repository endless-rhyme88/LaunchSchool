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

def win?(a, b)
  a.values[0].include?(b.keys[0])
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("ROCK!! PAPER!!: #{player.keys[0]} vs #{computer.keys[0]} You won!")
  elsif win?(computer, player)
    prompt("ROCK!! PAPER!!: #{player.keys[0]} vs #{computer.keys[0]} Computer wins!")
  else
    prompt("ROCK!! PAPER!!: #{player.keys[0]} vs #{computer.keys[0]} It's a tie!")
  end
end

def clear_prompt
  system "clear"
end

def prompt(message)
  puts ">>#{message.strip}"
end

prompt("Welcome to Rock, Paper, Spock. the first to 3 wins The match..choose your weapon:")

computer_choice = ''
player_choice = ''
player_score = 0
computer_score = 0
round_num = 0

loop do
  until computer_score == 3 || player_score == 3

    computer_choice = VALID_CHOICES.to_a.sample(1).to_h

    get_confirm = ''

    if computer_score == 2
      prompt("PSST!! Need a hand? I got some intel you may find useful.")
      loop do
        print "(Press Y or N):"
        get_confirm = gets.chomp.capitalize
        if get_confirm == 'N'
          clear_prompt
          break
        elsif get_confirm == 'Y'
          clear_prompt
          puts "Downloading Intel...."
          sleep(1)
          clear_prompt
          prompt("The COMPUTER equipped: '#{computer_choice.keys[0]}!!' good luck!")
          break
        else
          prompt("Invalid input")
        end
      end
    end
    prompt("PLAYER: #{player_score}, COMPUTER: #{computer_score}")

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
                            press  H) for help
        MSG
        print 'I equip:'
        player_choice = gets.chomp.capitalize
        if %w[R P Sc L Sp Rock Paper Scissors Lizard Spock].include?(player_choice)
          player_choice = VALID_CHOICES.select { |k, _| k.capitalize.match?(player_choice) }
          break
        elsif player_choice == 'H'
          clear_prompt
          print_matchups
          loop do
            print '(Press L to leave):'
            get_confirm = gets.chomp.capitalize
            if get_confirm == 'L'
              clear_prompt
              break
            else
              prompt("Invalid input")
            end
          end
        else
          prompt('Invalid input')
        end
      end

      clear_prompt

      prompt("The path of #{player_choice.keys[0]}, is the path you choose?")

      get_confirm = ''
      loop do
        print "(Press Y or N):"
        get_confirm = gets.chomp.capitalize
        if get_confirm == 'Y'
          break
        elsif get_confirm == 'N'
          break
        else
          prompt("Invalid input")
        end
      end
      clear_prompt
      break unless get_confirm == 'N'
    end

    clear_prompt

    puts "Processing..."

    sleep(0.99)

    clear_prompt

    display_results(player_choice, computer_choice)

    round_num += 1

    if win?(player_choice, computer_choice)
      player_score += 1
    elsif win?(computer_choice, player_choice)
      computer_score += 1
    end

    if player_score == 3
      prompt("The grand winner is the player!!")
    elsif computer_score == 3
      prompt("The grand winner is the computer!!")
    end
  end

  prompt("Wanna play again?")

  play_again = ''
  loop do
    print '(Press Y or N):'
    play_again = gets.chomp.capitalize
    if play_again == 'N'
      puts "Hope you had fun! :)"
      break
    elsif play_again == 'Y'
      player_score = 0
      computer_score = 0
      round_num = 0
      break
    else
      prompt("Invalid input")
    end
  end
  break unless play_again == 'Y'
  clear_prompt
  puts "Resetting.."
  sleep(0.99)
  clear_prompt
end
