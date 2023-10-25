require_relative 'player'

class MainPlayer < Player
  def initialize
    super
    @subject = 'あなた'
  end
end