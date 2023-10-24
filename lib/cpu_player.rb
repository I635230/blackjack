class CPUPlayer < Player
  attr_reader :subject
  @@cpu_number = 0
  def initialize
    super
    @@cpu_number += 1
    @subject = "CPU_#{@@cpu_number}"
  end

  def set_chip
    @bet = 10
    @chip -= 10
  end
end