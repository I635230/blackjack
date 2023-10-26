# encoding: UTF-8
# frozen_string_literal: true

# chip
class Chip
  def process_chip(target, hand)
    case hand.outcome
    when :win then target.add_chip(hand.bet * 1.5) # TODO: 切り上げ処理する
    when :tie then target.add_chip(hand.bet)
    when :surrender then target.add_chip(hand.bet * 0.5)
    end
  end
end
