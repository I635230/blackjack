# frozen_string_literal: true

# hand
class Hand
  attr_reader :cards, :point, :outcome, :bet
  @@hand_count = 0

  def initialize
    @@hand_count += 1
    @cards = []
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
end
