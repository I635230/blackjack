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

  # def make_deck
  #   Card::SUITS.each do |suit|
  #     %w[A A A A A A A A A A].each do |number|
  #       @cards.push(Card.new(suit, number))
  #     end
  #   end
  # end

  def shuffle
    @cards.shuffle!
  end

  def deal_out(array)
    2.times do
      array.each do |target|
        target.hands.each do |hand|
          hand.cards.push(draw)
        end
      end
    end
  end

  def draw_add(hand)
    card = draw
    hand.cards.push(card)
    card
  end

  private
    def draw
      @cards.shift
    end
end
