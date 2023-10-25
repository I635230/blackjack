class Input
  def input_number_of_players
    3
  end

  def input_bet
    50
  end

  def self.input_special_effect
    case gets.chomp.downcase
    when 'sr' then :surrender
    when 'dd' then :double_down
    when 'sp' then :split
    when 'n' then false
    else
      # Display
      self.input_special_effect
    end
  end
end