class InputManager
  def input_number_of_players
    gets.to_i
  end

  def input_confirm_continue
    gets.chomp.downcase
  end
end