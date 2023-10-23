require './gambler.rb'

class Dealer < Gambler
  attr_reader :subject
  def initialize
    super
    @subject = 'ディーラー'
  end
end