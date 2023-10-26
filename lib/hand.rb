# frozen_string_literal: true

# hand
class Hand
  attr_reader :cards, :point, :outcome
  @@hand_count = 0

  def initialize
    @@hand_count += 1
    @cards = []
    @point = 0
    @outcome = :none
    set_hand_name
  end

  def set_hand_name
    if @@hand_count == 1
      @name = "手札"
    else
      @name = "手札#{@@hand_count}"
    end
  end
end
