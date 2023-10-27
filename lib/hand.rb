# encoding: UTF-8
# frozen_string_literal: true

# hand
class Hand
  attr_reader :cards, :point, :outcome, :bet, :draw_count

  def initialize
    @cards = []
    @draw_count = 0
  end

  def set_point=(point)
    @point = point
  end

  def set_outcome=(outcome)
    @outcome = outcome
  end

  def set_bet=(bet)
    @bet = bet
  end

  def add_bet=(bet)
    @bet += bet
  end

  def add_draw_count
    @draw_count += 1
  end

  def reset_hands(gambler_array)
    gambler_array.each do |gambler|
      gambler.reset_hand
    end
  end
end
