# encoding: UTF-8

require_relative 'player'

class MainPlayer < Player
  attr_reader :subject
  def initialize
    super
    @subject = 'あなた'
  end

  def set_chip
    chip = Input.input_set_chip
    @bet = chip
    @chip -= chip
  end

  def change_chip
    @chip -= @bet
    @bet = @bet*2
  end

  def judge_continue
    return false unless Input.input_judge_continue
    true
  end
end