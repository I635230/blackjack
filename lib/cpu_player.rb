# encoding: UTF-8
# frozen_string_literal: true

require_relative "player"

# cpu player
class CPUPlayer < Player
  @@cpu_count = 0
  def initialize
    super
    @@cpu_count += 1
    @subject = "CPU_#{@@cpu_count}"
  end
end
