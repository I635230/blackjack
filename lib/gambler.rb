# frozen_string_literal: true

require_relative "hand"

# gambler
class Gambler
  attr_reader :subject, :chip, :hand

  def initialize
    @hand = [Hand.new]
    @chip = 100
  end
end
