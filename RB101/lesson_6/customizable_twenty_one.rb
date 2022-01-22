def prompt(msg)
  puts ">> #{msg}"
end

def valid_integer?(input)
  if input == input.to_i
    input
  end
end

def custom_busted_limit
  limit = nil
  prompt('Pick a number greater than 20 but less than 308')
  loop do
    print ':'
    limit = gets.chomp.to_f
    break if valid_integer?(limit) && (limit > 20 && limit < 308)
    prompt('Sorry, that is an invalid choice')
  end
  limit
end

def add_players
  prompt('How many players? Press 2, 3, or 4')
  num_of_player = nil
  loop do
    print ':'
    num_of_player = gets.chomp.to_f
    break unless !valid_integer?(num_of_player) ||
                 (num_of_player < 2 || num_of_player > 4)
    prompt('Sorry, that is a invalid choice. Please select: 2, 3, or 4')
  end
  num_of_player
end

def min_value(hand_totals)
  hand_totals.min_by { |_, value| value }[0]
end

def max_value(hand_totals)
  hand_totals.max_by { |_, value| value }[0]
end

def disqualified_player(player_hands, player, deleted_players)
  deleted_players[player] = player_hands.delete(player)
end

def repositon_turn_order(player_hands)
  player_hands.sort_by { |player_name, _| player_name[-1] }.to_h
end

def human_or_cpu(player_hands)
  num_of_players = add_players.to_i
  num_of_players.times do |index|
    prompt("Player #{index + 1}, press 1) For Human, 2) For Computer")
    print ':'
    answer = gets.chomp
    if answer == '1'
      player_hands['P' + (index + 1).to_s] = []
    elsif answer == '2'
      player_hands['CPU' + (index + 1).to_s] = []
    else
      prompt('Sorry, not a valid choice')
    end
  end
end

def ace_value(card, hand)
  if hand.count('Ace') >= 2
    card.gsub(card, '1')
  else
    card.gsub(card, '11')
  end
end

def ace_correction(hand)
  if hand.count(1) >= 2
    hand[0] = 11
  else
    hand
  end
end

def convert_special_cards(card, hand)
  case card
  when 'Jack' then card.gsub(card, '10')
  when 'Queen'then card.gsub(card, '10')
  when 'King' then card.gsub(card, '10')
  when 'Ace'  then ace_value(card, hand)
  else
    card
  end
end

def hand_value(hand)
  values = hand.map { |card| convert_special_cards(card, hand).to_i }.sort
  ace_correction(values)
  values.sum
end

def hit(hand, deck)
  hand.push(deck.shift)
end

def bust?(hand_total)
  hand_total > BUSTED_LIMIT
end

def victor(player_hands, hand_totals)
  if hand_totals.values.all?(hand_totals[player_hands.keys[0]])
    'Nobody'
  else
    max_value(hand_totals)
  end
end

def display_current_hand(hand)
  suite = %w(Spades Hearts Clubs Diamonds)
  hand.each { |card| print "#{card} of #{suite.sample}, " }
end

def cpu_player(hand, deck, player, hand_total, turn)
  until (hand_total[player] = hand_value(hand)) >= (BUSTED_LIMIT - 4)
    break if deck.size == 0
    system 'clear'
    prompt("#{player} is thinking")
    sleep(0.99)
    prompt("#{player} drew a card")
    sleep(0.99)
    hit(hand, deck)
  end
  turn[player] = false
end

def display_scene(hand, player)
  puts
  prompt("#{player}'s hand:")
  display_current_hand(hand)
  puts
  prompt('1) for Hit, 2) for Stay, 3) your hand total')
  prompt("Don't go over: #{BUSTED_LIMIT}")
  puts
  print ':'
end

def show_hand(current_player, player_hands)
  player_hands.each do |player, _|
    if player == current_player
      next
    else
      prompt("#{player}'s hand: #{player_hands[player][0]} and ...")
    end
  end
end

def end_game?(player, hand_total, deck)
  bust?(hand_total[player]) || deck.size == 0
end

def human_player(hand, deck, player, hand_total, turn)
  loop do
    display_scene(hand, player)
    answer = gets.chomp
    if answer == '1'
      system 'clear'
      prompt("Drew a: #{hit(hand, deck)[-1]}")
      hand_total[player] = hand_value(hand)
    elsif answer == '3'
      system 'clear'
      prompt("Your hand value: #{hand_total[player]}")
    end
    break if answer == '2' || end_game?(player, hand_total, deck)
  end
  turn[player] = false
end

def alternate_player(turn)
  players = turn.keys
  player = turn.key(true)
  if player != players[-1]
    turn[players[players.index(player) + 1]] = true
  end
  player
end

def players_turn(player_hands, player, deck, hand_total, turn)
  if player[0] == 'P'
    human_player(player_hands[player], deck, player, hand_total, turn)
  else
    cpu_player(player_hands[player], deck, player, hand_total, turn)
  end
end

def all_hand_totals(player_hands)
  player_hands.each_with_object({}) do |(k, _), total|
    total[k] = hand_value(player_hands[k])
  end
end

def whose_turn?(player_hands)
  player_hands.each_with_object({}) do |(player, _), turn|
    turn[player] = player == player_hands.keys[0]
  end
end

def starting_hand(deck, player_hands)
  player_hands.each { |player, _| player_hands[player] = deck.shift(2) }
end

def compare(hand_totals)
  hand_totals.each do |player, value|
    if player != hand_totals.keys[-1]
      print value.to_s + " vs "
    else
      print value
    end
  end
end

def tournament(player_hands, hand_totals, deleted_players)
  if player_hands.size == 2
    compare(hand_totals)
    puts
    prompt("#{victor(player_hands, hand_totals)} Wins!!!")
  else
    system 'clear'
    compare(hand_totals)
    puts
    prompt("#{min_value(hand_totals)} is out!!!")
    sleep(2)
  end
  (disqualified_player(player_hands, min_value(hand_totals), deleted_players))
end

def tourney_bust(player_hands, player, hand_totals, deleted_players)
  if player_hands.size == 2
    prompt("Uh OH, #{player} went over #{BUSTED_LIMIT}," \
    " #{min_value(hand_totals)} wins!!")
  else
    prompt("Uh OH, #{player} went over #{BUSTED_LIMIT}, you're out!!")
    sleep(2)
  end
  (disqualified_player(player_hands, max_value(hand_totals), deleted_players))
end

deleted_players = {}
prompt('customize busted limit? Y) yes, N) no')
loop do
  print ':'
  answer = gets.chomp.upcase
  if answer == 'Y'
    BUSTED_LIMIT = custom_busted_limit.to_i
    break
  elsif answer == 'N'
    BUSTED_LIMIT = 21
    break
  else
    prompt('Invalid Input')
  end
end

player_hands = {}

human_or_cpu(player_hands)

loop do
  until player_hands.size == 1
    turn = whose_turn?(player_hands)
    deck = []
    values = ('2'..'10').to_a
    special_cards = %w(Ace Jack Queen King)
    36.times { deck.push(values.sample) }
    4.times { (deck.push(special_cards)).flatten!.shuffle! }
    starting_hand(deck, player_hands)
    hand_totals = all_hand_totals(player_hands)
    system 'clear'
    prompt("Hit or Stay? ")

    current_player = nil
    loop do
      current_player = alternate_player(turn)
      show_hand(current_player, player_hands)
      puts
      players_turn(player_hands, current_player, deck, hand_totals, turn)
      system 'clear'
      prompt("#{current_player} chose to stay")
      break if end_game?(current_player, hand_totals, deck) ||
               current_player == player_hands.keys[-1]
    end

    if bust?(hand_totals[current_player])
      tourney_bust(player_hands, current_player, hand_totals, deleted_players)
    else
      tournament(player_hands, hand_totals, deleted_players)
    end
  end

  prompt("Play again? Y) Yes, N) No")
  answer = gets.chomp.upcase
  if answer == 'Y'
    player_hands.merge!(deleted_players)
    deleted_players.clear
    player_hands = repositon_turn_order(player_hands)
  else
    break
  end
end
prompt("Thank you for playing Twenty-One!!")
