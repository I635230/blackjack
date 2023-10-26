require_relative 'gambler'

class Dealer < Gambler
  def initialize
    @subject = 'ディーラー'
  end
end