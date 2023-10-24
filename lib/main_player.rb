require_relative 'player'

class MainPlayer < Player
  def initialize
    super
  end

  def judge_continue
    false
  end
end