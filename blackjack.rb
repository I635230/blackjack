# encoding: UTF-8
# frozen_string_literal: true

require 'debug'

# constant number
UPPER_POINT = 21
DEALER_JUDGE_UPPER_POINT = 17
NUMBER_OF_INITIAL_HAND = 2

# require
require './card'
require './gambler'
require './dealer'
require './player'
require './main_player'
require './cpu_player'
require './blackjack_system'
require './display_system'

# explain
DisplaySystem.send_start_messages

# declare
display_system = DisplaySystem.new
blackjack_system = BlackjackSystem.new(1)
dealer = Dealer.new
player1 = MainPlayer.new

# make a deck
deck = blackjack_system.make_a_deck
deck = deck.shuffle

# deal out cards
(1..NUMBER_OF_INITIAL_HAND).each do 
  blackjack_system.deal_out_cards([dealer, player1], deck)
end

# show gambler hands
DisplaySystem.puts_line
display_system.show_player_hand(player1)
DisplaySystem.puts_line
display_system.show_dealer_hand(dealer)
DisplaySystem.puts_line

# player loop
loop do
  ## show player sum point
  player1.calculate_sum_point
  blackjack_system.deal_burst(player1)
  display_system.show_sum_point(player1)
  display_system.confirm_draw_a_card(player1)

  ## player input
  if blackjack_system.branch_out_draw_a_card
    card = blackjack_system.draw_and_add_to_hand(deck, player1)
    display_system.show_drawing_a_card(card, player1)
  else
    break
  end
end

# show dealer hand second
display_system.show_dealer_hand_second(dealer)

# dealer loop
loop do
  ## judge burst and continue game
  dealer.calculate_sum_point
  blackjack_system.deal_burst(dealer)
  unless blackjack_system.judge_continue_game([player1], dealer)
    display_system.puts_dealer_exceed
    DisplaySystem.puts_judge_outcome(:lose)
    exit
  end
  ## show dealer sum point
  display_system.show_sum_point(dealer)

  ## dealer draw
  if dealer.dealer_continue_check(dealer)
    card = blackjack_system.draw_and_add_to_hand(deck, dealer)
    display_system.show_drawing_a_card(card, dealer)
  else
    break
  end
end

# show all sum point
DisplaySystem.puts_line
display_system.show_sum_point(player1)
display_system.show_sum_point(dealer)
DisplaySystem.puts_line

# judge win or lost
blackjack_system.judge_outcome(player1, dealer)

# explain
DisplaySystem.send_end_messages
