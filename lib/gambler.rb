require_relative 'hand'

class Gambler
  attr_reader :hand, :point, :outcome, :subject
  def initialize
    @hand = Hand.new
    @point = 0
    @outcome = :none
  end

  def judge_continue
    return false if @point > 17
    true
  end

  def set_outcome=(outcome)
    @outcome = outcome
  end

  def set_point=(point)
    @point = point
  end
end