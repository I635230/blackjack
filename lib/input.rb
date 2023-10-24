module Input
  def self.input_number_of_players
    input = gets.chomp
    case input
    when '1' then input.to_i
    when '2' then input.to_i
    when '3' then input.to_i
    else
      Display.show_123
      input_number_of_players
    end
  end

  def self.input_judge_continue
    input = gets.chomp.downcase
    case input
    when 'y' then true
    when 'n' then false
    else
      Display.show_yn
      input_judge_continue
    end
  end

  def self.input_set_chip
    input = gets.to_i
    if input >= 10 && input <= 100
      input
    else
      Display.show_number_range
      input_set_chip
    end
  end
end