class Card
  attr_reader :card

  SUIT = %i[heart spade clover diamond]
  NUMBER = %w[A 2 3 4 5 6 7 8 9 10 J Q K]

  def initialize(suit, number)
    @card = [suit, number]
  end
end