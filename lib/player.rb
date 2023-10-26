# frozen_string_literal: true
# encoding: UTF-8

require_relative "gambler"

# player
class Player < Gambler
  def initialize
    super
  end

  def set_bet(input, hand)
    hand.set_bet = input
    @chip -= input
  end

  def add_bet(input, hand)
    hand.add_bet = input
    @chip -= input
  end

  def set_special=(special)
    @special = special
  end

  def add_chip(chip_diff)
    @chip += chip_diff
  end
end
