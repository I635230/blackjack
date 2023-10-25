require_relative 'gambler'

class Player < Gambler
  attr_reader :chip, :bet
  def initialize
    super
    @chip = 100
  end

  def set_bet(input)
    @chip -= input
    @bet = input
  end

  def add_chip(chip_diff)
    @chip += chip_diff
  end
end