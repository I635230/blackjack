class Deck
  attr_reader :deck

  def initialize
    @cards = generate_deck
    shuffle
  end

  def generate_deck
    cards = []
    Card::SUIT.each do |suit|
      Card::NUMBER.each do |number|
        cards << Card.new(suit, number)
      end
    end
    cards
  end

  def shuffle
    @cards.shuffle!
  end

  def draw
    @cards.shift
  end
end