require_relative 'display'

class Effect
  def special_effect(gambler)
    Display.show_option_special_effect
    option = Input.input_special_effect
    case option
    when :surrender then surrender(gambler)
    when :double_down then double_down(gambler)
    when :split then split(gambler)
    when false then return
    end
  end

  def surrender(gambler)
    gambler.set_outcome = :surrender
    gambler.set_special = :surrender
  end

  def double_down(gambler)
    gambler.set_special = :double_down
    Hand.prepare_double_down(gambler)
  end

  def split(gambler)
    gambler.set_special = :split
  end

  def confirm_bust(gambler)
    if gambler.point > 21
      gambler.set_outcome = :lose
      return true
    end
    false
  end
end