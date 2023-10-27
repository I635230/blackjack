# frozen_string_literal: true

require_relative "player"

# main_player
class MainPlayer < Player
  def initialize
    super
    @subject = "あなた"
  end

  def judge_continue(input)
    input
  end
end
