# frozen_string_literal: true

require_relative "input"
require_relative "display"
require_relative "hand"

# effect
class Effect
  def initialize
    @input = Input.new
  end

  def deal_special_effect(target)
    Display.show_confirm_special_effect
    if Input.input_confirm_special
      Display.show_option_special_effect
      special_effect(target)
    end
  end

  def special_effect(target)
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
    Display.show_decision_surrender
  end

  def double_down(target)
  end

  def split(target)
    hands = target.hands
    if target.chip < hands[0].bet
      Display.show_lack_chip
      return
    end
    if confirm_same(hands[0].cards[0], hands[0].cards[1])
      hands.push(Hand.new)
      hands[1].cards.push(hands[0].cards.shift)
      target.set_bet(hands[0].bet, target.hands[1])
    else
      Display.show_not_match
    end
  end

  private
    def confirm_same(card1, card2)
      return true if card1.number == card2.number
      false
    end
end
