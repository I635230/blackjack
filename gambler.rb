class Gambler
  attr_accessor :hand
  attr_reader :sum_point
 
  def initialize
    @hand = []
  end

  def calculate_sum_point
    @sum_point = 0
    @hand.each do |symbol, number|
      @sum_point += convert_number_to_point(number)
    end
    @sum_point
  end

  def convert_number_to_point(number)
    if number >= 10
      10
    else
      number
    end
  end
end