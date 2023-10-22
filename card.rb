class Card
  def initialize(symbol, number)
    @symbol = symbol
    @number = number
  end

  def press_info
    [@symbol, @number]
  end
end