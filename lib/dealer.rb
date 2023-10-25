require_relative 'gambler'

class Dealer < Gambler
  def initialize
    super
    @subject = 'ディーラー'
  end
end