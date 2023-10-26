# frozen_string_literal: true

# outcome
class Outcome
  def set_outcome(player_hand, dealer_hand)
    return if [:lose, :surrender].include?(player_hand.outcome)
    return if dealer_hand.outcome == :lose
    if player_hand.point > dealer_hand.point
      player_hand.set_outcome = :win
    elsif player_hand.point < dealer_hand.point
      player_hand.set_outcome = :lose
    else
      player_hand.set_outcome = :tie
    end
  end
end
