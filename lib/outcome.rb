class Outcome
  def set_outcome(player, dealer)
    return if player.outcome == :lose
    return deal_dealer_lose(player) if dealer.outcome == :lose
    if player.point > dealer.point
      player.set_outcome = :win
    elsif player.point < dealer.point
      player.set_outcome = :lose
    else
      player.set_outcome = :tie
    end
  end

  private

  def deal_dealer_lose(player)
    if dealer.outcome == :lose
      player.set_outcome = :win
    end
  end
end