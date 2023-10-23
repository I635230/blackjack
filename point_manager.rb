class PointManager
  def calculate_point(hand)
    point = 0
    hand.each do |symbol, number|
      point += number
    end
    point
  end
end