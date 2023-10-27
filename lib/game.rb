# frozen_string_literal: true

require_relative "display"
require_relative "input"
require_relative "deck"
require_relative "point"
require_relative "effect"
require_relative "outcome"
require_relative "chip"
require_relative "main_player"
require_relative "cpu_player"
require_relative "dealer"

# game
class Game
  include Display
  include Outcome
  include Input
  include Effect
  include Point
  include Chip

  def initialize
    make_basic_instance
  end

  def set_number_of_players
    show_select_number_of_players
    @number_of_players = input_number_of_players
    set_other_varibale
    make_gambler_instance
  end

  def set_chip
    @hand.reset_hands(@gambler_array)
    @player_array.each do |player|
      show_set_bet(player) if player.is_a?(MainPlayer)
      player.is_a?(MainPlayer) ? bet = correct_bet(player) : bet = 10
      player.set_bet(bet, player.hands[0])
    end
  end

  def set_environment
    @deck.make_deck
    @deck.shuffle
    @deck.deal_out(@gambler_array)
    show_hands_all(@gambler_array)
  end

  def play_turn
    @gambler_array.each do |gambler|
      deal_special_effect(gambler) if gambler.is_a?(MainPlayer)
      show_dealer_hand_second(gambler) if gambler.is_a?(Dealer)
      gambler.hands.each_with_index do |hand, i|
        index = correct_index(i)
        calculate(hand)
        play_loop(gambler, hand, index)
        show_turn_end(gambler, index)
      end
    end
  end

  def deal_outcome
    show_final_point(@gambler_array)
    @player_array.each do |player|
      player.hands.each_with_index do |hand, i|
        index = correct_index(i)
        set_outcome(hand, @dealer.hands[0])
        process_chip(player, hand)
        show_final_chip(player, hand, index)
      end
    end
  end

  def confirm_continue
    show_confirm_continue_game
    input_confirm_continue
  end

  private
    def make_basic_instance
      @deck = Deck.new
      @hand = Hand.new
    end

    def set_other_varibale
      @number_of_cpu_players = @number_of_players - 1
      @number_of_gamblers = @number_of_players + 1
    end

    def make_gambler_instance
      @player1 = MainPlayer.new
      @player2 = CPUPlayer.new
      @player3 = CPUPlayer.new
      @dealer = Dealer.new
      set_gambler_array
      set_player_array
    end

    def set_gambler_array
      @gambler_array = case @number_of_gamblers
                       when 2 then [@player1, @dealer]
                       when 3 then [@player1, @player2, @dealer]
                       when 4 then [@player1, @player2, @player3, @dealer]
      end
    end

    def set_player_array
      @player_array = @gambler_array.slice(0, @number_of_players)
    end

    def play_loop(gambler, hand, i)
      loop do
        break if hand.outcome == :surrender
        show_hands(gambler, hand, i)
        gambler.is_a?(MainPlayer) ? show_confirm_continue : new_line
        break unless judge_continue(gambler, hand)
        card = @deck.draw_add(hand)
        show_drawing_a_card(card, gambler, i)
        calculate(hand)
        break if deal_bust(hand)
        break if confirm_double_down(gambler, hand)
      end
    end

    def judge_continue(gambler, hand)
      if gambler.is_a?(MainPlayer)
        gambler.judge_continue(input_judge_continue)
      else
        gambler.judge_continue(hand)
      end
    end

    def correct_index(i)
      i + 1
    end
end
