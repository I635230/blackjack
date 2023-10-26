# frozen_string_literal: true

require_relative "hand"

# gambler
class Gambler
  attr_reader :subject, :chip, :hands

  def initialize
    @hands = [Hand.new]
    @chip = 100
  end

  def judge_continue(hand)
    return false if hand.point > 17
    true
  end
end
