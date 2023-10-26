# frozen_string_literal: true

require_relative "input"
require_relative "display"
require_relative "hand"

# effect
class Effect
  def initialize
    @input = Input.new
  end

  def special_effect(target)
    Display.show_option_special_effect
    case @input.input_special_effect
    when :surrender then surrender(target)
    when :double_down then double_down(target)
    when :split then split(target)
    when false then nil
    end
  end

  def surrender(target)
    target.set_special = :surrender
    target.hands[0].set_outcome = :surrender
  end

  def double_down(target)
  end

  def split(target)
    if confirm_same(target.hands[0].cards[0], target.hands[0].cards[1])
      target.hands.push(Hand.new)
      target.hands[1].cards.push(target.hands[0].cards.shift)
      target.set_bet(50, target.hands[1])
    else
      puts "番号が一致していません。"
    end
  end

  private
    def confirm_same(card1, card2)
      return true if card1.number == card2.number
      false
    end
end
