require_relative 'multi_cards'

class Hand < MultiCards
  def initialize
    super
  end

  def self.prepare_double_down(gambler)
    gambler.hand_second.cards.push(gambler.hand.cards.shift)
  end
end