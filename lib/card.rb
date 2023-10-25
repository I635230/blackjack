class Card
  attr_reader :suit, :number
  SUITS = %i[heart spade clover diamond]
  NUMBER = %w[A 2 3 4 5 6 7 8 9 10 J Q K]

  def initialize(suit, number)
    @suit = suit
    @number = number
  end
end