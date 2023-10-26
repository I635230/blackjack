# frozen_string_literal: true
# encoding: UTF-8

require_relative "gambler"

# dealer
class Dealer < Gambler
  def initialize
    super
    @subject = "ディーラー"
  end
end
