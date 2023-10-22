# encoding: UTF-8
# frozen_string_literal: true

class Dealer < Gambler
  def dealer_continue_check(dealer)
    if dealer.sum_point >= DEALER_JUDGE_UPPER_POINT
      false
    else
      true
    end
  end
end