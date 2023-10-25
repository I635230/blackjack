class Chip
  def process_chip(player)
    case player.outcome
    when :win then player.add_chip(player.bet * 1.5)
    when :tie then player.add_chip(player.bet)
    when :surrender then player.add_chip(player.bet * 0.5)
    # when :double_down then 
    # when :split then 
    end
  end
end