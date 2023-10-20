# encoding: UTF-8
# frozen_string_literal: true

# require 'debug'


UPPER_POINT = 21
DEALER_JUDGE_UPPER_POINT = 17

class Card
  def initialize(symbol, number)
    @symbol = symbol
    @number = number
  end

  def press_info
    [@symbol, @number]
  end
end

class Gambler
  attr_accessor :hand
  attr_reader :sum_point
 
  def initialize
    @hand = []
  end

  def calculate_sum_point
    @sum_point = 0
    @hand.each do |symbol, number|
      @sum_point += convert_number_to_point(number)
    end
    @sum_point
  end

  def convert_number_to_point(number)
    if number >= 10
      10
    else
      number
    end
  end
end

class Dealer < Gambler
  def dealer_continue_check(dealer)
    if dealer.sum_point >= DEALER_JUDGE_UPPER_POINT
      false
    else
      true
    end
  end
end

class Player < Gambler
end

class BlackjackSystem
  def initialize(player_count)
    @player_count = player_count
    @dealer_count = 1
    @gambler_count = @player_count + @dealer_count
  end

  def make_a_deck
    deck = []
    all_symbol_array = %w[heart clover spade diamond]
    for symbol in all_symbol_array do
      ([symbol]*13).zip((1..13).to_a) do |symbol, number|
        deck.push([symbol, number])
      end
    end
    deck
  end

  def draw_a_card(deck)
    card = deck.shift
  end

  def draw_and_add_to_hand(deck, player)
    card = draw_a_card(deck)
    player.hand.push(card)
    card
  end

  def deal_out_cards(gambler_array, deck)
    gambler_array.each do |gambler|
      card = draw_a_card(deck)
      gambler.hand.push(card)
    end
  end

  def branch_out_draw_a_card
    player_draw_option = gets.chomp
    case player_draw_option
    when 'Y' then true
    when 'N' then false
    else
      puts 'YかNを入力してください。'
      branch_out_draw_a_card
    end
  end

  def judge_outcome(player, dealer)
    if player.sum_point > dealer.sum_point
      puts 'あなたの勝利です！'
    elsif player.sum_point < dealer.sum_point
      puts 'あなたの敗北です...'
    elsif player.sum_point == dealer.sum_point
      puts '惜しい！引き分けです。'
    end
  end
end

class DisplaySystem
  def initialize
    @correspondence_table = {
      'heart' => 'ハート',
      'clover' => 'クローバー',
      'spade' => 'スペード',
      'diamond' => 'ダイヤモンド'
    }
  end

  def show_drawing_a_card(card, gambler)
    symbol, number = card
    if gambler.is_a?(Player)
      puts "あなたの引いたカードは#{@correspondence_table[symbol]}の#{number}です。"
    elsif gambler.is_a?(Dealer)
      puts "ディーラーの引いたカードは#{@correspondence_table[symbol]}の#{number}です。"
    end
  end

  def show_player_hand(player)
    player.hand.each do |hand_i|
      symbol, number = hand_i
      puts "あなたの引いたカードは#{@correspondence_table[symbol]}の#{number}です。"
    end
  end

  def show_dealer_hand(dealer)
    dealer.hand.each_with_index do |hand_i, i|
      if i >= 1
        puts 'ディーラーの引いた2枚目のカードはわかりません。'
      else
        symbol, number = hand_i
        puts "ディーラーの引いたカードは#{@correspondence_table[symbol]}の#{number}です。"
      end
    end
  end

  def show_dealer_hand_second(dealer)
    symbol, number = dealer.hand[1]
    puts "ディーラーの引いたカードは#{@correspondence_table[symbol]}の#{number}でした。"
  end

  def show_player_sum_point_and_draw_card(player)
    puts "あなたの現在の得点は#{player.sum_point}です。カードを引きますか？(Y/N)"
  end

  def show_player_sum_point(player)
    puts "あなたの現在の得点は#{player.sum_point}です。"
  end

  def show_dealer_sum_point(dealer)
    puts "ディーラーの現在の得点は#{dealer.sum_point}です。"
  end
end

# explain
puts 'プレーヤーの数を選んでください。最大3人までプレイ可能です。あなた以外のプレーヤーはCPUになります。'
puts '1人プレイが選択されました。'
puts 'それでは、ブラックジャックを開始します。'
puts '-----------------------------------------------------'

# declare
display_system = DisplaySystem.new
blackjack_system = BlackjackSystem.new(1)
dealer = Dealer.new
player1 = Player.new

# make a deck
deck = blackjack_system.make_a_deck
deck = deck.shuffle

# deal out cards
blackjack_system.deal_out_cards([dealer, player1], deck)
blackjack_system.deal_out_cards([dealer, player1], deck)

# show gambler hands
display_system.show_player_hand(player1)
puts '-----------------------------------------------------'
display_system.show_dealer_hand(dealer)
puts '-----------------------------------------------------'

# player loop
loop do
  ## show player sum point
  player1.calculate_sum_point
  display_system.show_player_sum_point_and_draw_card(player1)

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
  ## show dealer sum point
  dealer.calculate_sum_point
  display_system.show_dealer_sum_point(dealer)

  ## dealer draw
  if dealer.dealer_continue_check(dealer)
    card = blackjack_system.draw_and_add_to_hand(deck, dealer)
    display_system.show_drawing_a_card(card, dealer)
  else
    break
  end
end

# show all sum point
puts '-----------------------------------------------------'
display_system.show_player_sum_point(player1)
display_system.show_dealer_sum_point(dealer)
puts '-----------------------------------------------------'

# judge win or lost
blackjack_system.judge_outcome(player1, dealer)

# explain
puts 'ブラックジャックを終了します。'

# show gambler hands
# print dealer.hand
# print "\n"
# puts dealer.calculate_sum_point
# puts "-------------------"
# print player1.hand
# print "\n"
# puts player1.calculate_sum_point
# puts "-------------------"


# heart, clover, spade, diamond
# arrayは最初からシャッフルできるらしい
