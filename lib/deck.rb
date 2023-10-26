# frozen_string_literal: true

require_relative "card"

# deck
class Deck
  attr_reader :cards

  def initialize
    @cards = []
  end

  def make_deck
    Card::SUITS.each do |suit|
      Card::NUMBERS.each do |number|
        @cards.push(Card.new(suit, number))
      end
    end
  end

  def deal_out(array)
    2.times do
      array.each do |target|
        target.hand.each do |hand|
          hand.cards.push(draw)
        end
      end
    end
  end

  private
    def draw
      @cards.shift
    end
end
