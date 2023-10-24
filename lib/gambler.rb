class Gambler
  attr_reader :hand, :point, :outcome, :draw_restriction

  def initialize
    @hand = Hand.new
    @outcome = :None
    @point = 0
    @draw_restriction = false
  end

  def judge_continue
    return false if @point >= 17
    true
  end

  def set_point=(point)
    @point = point
  end

  def set_outcome=(outcome)
    @outcome = outcome
  end

  def on_draw_restriction
    @draw_restriction = true
  end
end