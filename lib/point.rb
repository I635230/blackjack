class Point
  def calculate(gambler)
    point = 0
    gambler.hand.cards.each do |card|
      point += convert_point(card.number)
    end
    gambler.set_point = point
  end

  private

  def convert_point(number)
    return 10 if %w[J Q K].include?(number)
    return 1 if number == 'A'
    return number.to_i
  end
end