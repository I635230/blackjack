class Gambler
  attr_reader :hand, :point

  def initialize
    @hand = Hand.new
  end

  def judge_continue
    false
  end
end