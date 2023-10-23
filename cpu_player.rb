require './player.rb'

class CPUPlayer < Player
  attr_reader :subject
  @@number = 1
  def initialize
    super
    @subject = "CPU_#{@@number}"
    @@number += 1
  end
end