require_relative 'gambler'

class Player < Gambler
  attr_reader :chip, :bet

  def initialize
    super
    @chip = 100
    @bet = 0
  end

  def add_chip(chip)
    @chip += chip
  end
end