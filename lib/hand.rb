class Hand
  attr_reader :cards, :draw_count

  def initialize
    @cards = []
    @draw_count = 0
  end

  def add_card(card)
    @cards << card
    @draw_count += 1
  end
end