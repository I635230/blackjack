require './player.rb'

class MainPlayer < Player
  attr_reader :subject
  def initialize
    super
    @subject = 'あなた'
  end
end