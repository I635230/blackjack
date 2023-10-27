# frozen_string_literal: true

require_relative "display"

# chip
module Chip
  include Display

  def process_chip(target, hand)
    case hand.outcome
    when :win then target.add_chip(round_up(hand.bet * 1.5))
    when :tie then target.add_chip(hand.bet)
    when :surrender then target.add_chip(round_up(hand.bet * 0.5))
    end
  end

  def round_up(number)
    number.ceil
  end

  def confirm_enough_chip(bet, chip)
    return false if bet > chip
    true
  end

  def correct_bet(target)
    bet = input_bet
    if confirm_enough_chip(bet, target.chip)
      bet
    else
      show_bet_error
      correct_bet(target)
    end
  end
end
