class Gambler
  attr_reader :hand

  def initialize
    @hand = Hand.new
  end
end