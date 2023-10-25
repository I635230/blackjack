require_relative 'gambler'

class Player < Gambler
  attr_reader :chip, :bet, :hand_second
  def initialize
    super
    @hand_second = Hand.new
    @special = :None
    @chip = 100
  end

  def set_special=(special)
    @special = special
  end

  def set_bet(input)
    @chip -= input
    @bet = input
  end

  def add_chip(chip_diff)
    @chip += chip_diff
  end
end