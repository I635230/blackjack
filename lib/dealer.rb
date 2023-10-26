# encoding: UTF-8
# frozen_string_literal: true

require_relative "gambler"

# dealer
class Dealer < Gambler
  def initialize
    super
    @subject = "ディーラー"
  end
end
