# encoding: UTF-8
# frozen_string_literal: true

class Card
  def initialize(symbol, number)
    @symbol = symbol
    @number = number
  end

  def press_info
    [@symbol, @number]
  end
end