require_relative 'multi_cards'
require_relative 'card'

class Deck < MultiCards
  def 
    super
  end

  def make_deck
    Card::SUITS.each do |suit|
      Card::NUMBER.each do |number|
        @cards.push(Card.new(suit, number))
      end
    end
  end

  def deal_out(gambler_array)
    2.times do
      gambler_array.each do |gambler|
        debugger
        gambler.hand.cards.push(draw)
      end
    end
  end

  private

  def draw
    @cards.shift
  end
end