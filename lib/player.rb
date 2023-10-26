# frozen_string_literal: true

require_relative "gambler"

# player
class Player < Gambler
  attr_reader :bet

  def initialize
    super
  end

  def set_bet(input)
    @bet = input
    @chip -= input
  end
end
