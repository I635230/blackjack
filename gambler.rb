class Gambler
  attr_accessor :hand
  attr_reader :point
  def initialize
    @hand = []
  end

  def set_point=(point)
    @point = point
  end
end