class Gambler
  attr_reader :hand, :point, :outcome

  def initialize
    @hand = Hand.new
    @outcome = :None
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
end