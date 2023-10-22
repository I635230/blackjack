# encoding: UTF-8
# frozen_string_literal: true

require './subject'

class BlackjackSystem
  include Subject

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
    player_draw_option = gets.chomp.downcase
    case player_draw_option
    when 'y' then true
    when 'n' then false
    else
      puts 'YかNを入力してください。'
      branch_out_draw_a_card
    end
  end

  def deal_burst(gambler)
    subject = subject_branch(gambler)
    if gambler.sum_point > 21
      puts "#{subject}はバーストしました。"
      if gambler.is_a?(MainPlayer) then DisplaySystem.puts_judge_outcome(:lose)
      elsif gambler.is_a?(Dealer) then DisplaySystem.puts_judge_outcome(:win)
      end
      exit
    end
  end

  def judge_continue_game(player_array, dealer)
    bool = false
    player_array.each do |player|
      if player.sum_point >= dealer.sum_point # 1人でもディーラーのポイントを上回っていれば続行
        bool = true
      end
    end
    bool
  end

  def judge_outcome(player, dealer)
    if player.sum_point > dealer.sum_point then DisplaySystem.puts_judge_outcome(:win)
    elsif player.sum_point < dealer.sum_point then DisplaySystem.puts_judge_outcome(:lost)
    elsif player.sum_point == dealer.sum_point then DisplaySystem.puts_judge_outcome(:tie)
    end
  end

  # ----------------------------------------------------------------点数管理システム クラスを分けた方が良さそう

  # def calculate_sum_point
  #   @sum_point = 0
  #   @hand.each do |symbol, number|
  #     @sum_point += convert_number_to_point(number)
  #   end
  #   @sum_point
  # end

  def calculate_sum_point(gambler)
    hand = gambler.hand
    sum_point_list = [0]
    hand.each do |symbol, number|
      if number == 1
        tmp_sum_point_list = sum_point_list
        sum_point_list = []
        tmp_sum_point_list.each do |each_sum_point|
          sum_point_list.append(each_sum_point + 1)
          sum_point_list.append(each_sum_point + 11)
        end
      else
        sum_point_list.each_with_index do |each_sum_point, i|
          sum_point_list[i] += convert_number_to_point(number)
        end
      end
    end
    gambler.sum_point = max_point(sum_point_list, gambler)
  end

  def max_point(sum_point_list, gambler)
    max_sum_point = 0
    sum_point_list.each do |each_sum_point|
     if each_sum_point >= 0 && each_sum_point <= 21
      max_sum_point = [max_sum_point, each_sum_point].max
     end
    end
    if max_sum_point == 0
      gambler.sum_point = 10**8
      deal_burst(gambler)
    else 
      max_sum_point
    end
  end

  def convert_number_to_point(number)
    # debugger
    if number >= 10
      10
    else
      number
    end
  end

  # ----------------------------------------------------------------点数管理システム クラスを分けた方が良さそう
end