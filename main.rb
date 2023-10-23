# encoding: UTF-8
# frozen_string_literal: true

require './main_player'
require './cpu_player'
require './dealer.rb'

require './game_system.rb'
require './card_manager.rb'
require './display_system.rb'
require './point_manager.rb'
require './input_manager.rb'
require './judge_system.rb'
require './loop_manager.rb'

DEAL_OUT_TIMES = 2

# prepare
## generate gambler
dealer = Dealer.new
player1 = MainPlayer.new
player2 = CPUPlayer.new
player3 = CPUPlayer.new

## make almost system # TODO: CPUのループを一つのメソッドにまとめたい
game_system = GameSystem.new
display_system = DisplaySystem.new
input_manager = InputManager.new
point_manager = PointManager.new
card_manager = CardManager.new
judge_system = JudgeSystem.new

## set number_of_gamblers
display_system.show_select_number_of_players
game_system.set_number_of_players = input_manager.input_number_of_players

# generate gambler_array
game_system.set_gambler_array([player1, player2, player3, dealer])

## set gambler_array
display_system.set_gambler_array = game_system.gambler_array
card_manager.set_gambler_array = game_system.gambler_array

# start
display_system.show_start_message(game_system.number_of_gamblers)

## deal out cards
# card_manager.shuffle_deck
(1..DEAL_OUT_TIMES).each do |times|
  card_manager.deal_out_cards
end
display_system.show_hands

## main player loop
loop do
  ### calculate and display point
  player1.set_point = point_manager.calculate_point(player1.hand) # gamblerクラスの外(point managerクラス)から、gamblerクラスの属性を変更したい -> setterが必要！
  display_system.show_point(player1)

  ### confirm continue
  display_system.show_confirm_continue
  bool_confirm_continue = input_manager.input_confirm_continue
  break unless judge_system.judge_continue(bool_confirm_continue, input_manager, judge_system)

  ### draw a card
  card = card_manager.draw_and_add_to_hand(player1)
  display_system.show_drawing_a_card(card, player1)
end

## cpu loop
loop do
  game_system.cpu_turn()
end

## dealer loop
loop do
  break
end

## show point
display_system.show_final_point

## end
display_system.show_end_message