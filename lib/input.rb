module Input
  def self.input_number_of_players
    input = gets.chomp
    case input
    when '1' then input.to_i
    when '2' then input.to_i
    when '3' then input.to_i
    else
      input_number_of_players
    end
  end

end