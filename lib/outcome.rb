# frozen_string_literal: true

# outcome
module Outcome
  def set_outcome(player_hand, dealer_hand)
    return if [:lose, :surrender].include?(player_hand.outcome)
    return deal_dealer_lose(player_hand) if dealer_hand.outcome == :lose
    if player_hand.point > dealer_hand.point
      player_hand.set_outcome = :win
    elsif player_hand.point < dealer_hand.point
      player_hand.set_outcome = :lose
    else
      player_hand.set_outcome = :tie
    end
  end

  def deal_dealer_lose(player_hand)
    player_hand.set_outcome = :win
  end
end
