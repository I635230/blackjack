require_relative 'gambler'

class Dealer < Gambler
  attr_reader :subject
  def initialize
    super
    @subject = 'ディーラー'
  end
end