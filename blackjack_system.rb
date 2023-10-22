require './subject'

class BlackjackSystem
  include Subject

  def initialize(player_count)
    @player_count = player_count
    @dealer_count = 1
    @gambler_count = @player_count + @dealer_count
  end
  
  def make_a_deck
    deck = []
    all_symbol_array = %w[heart clover spade diamond]
    for symbol in all_symbol_array do
      ([symbol]*13).zip((1..13).to_a) do |symbol, number|
        deck.push([symbol, number])
      end
    end
    deck
  end

  def draw_a_card(deck)
    card = deck.shift
  end

  def draw_and_add_to_hand(deck, player)
    card = draw_a_card(deck)
    player.hand.push(card)
    card
  end

  def deal_out_cards(gambler_array, deck)
    gambler_array.each do |gambler|
      card = draw_a_card(deck)
      gambler.hand.push(card)
    end
  end

  def branch_out_draw_a_card
    player_draw_option = gets.chomp.downcase
    case player_draw_option
    when 'y' then true
    when 'n' then false
    else
      puts 'YかNを入力してください。'
      branch_out_draw_a_card
    end
  end

  def deal_burst(gambler)
    subject = subject_branch(gambler)
    if gambler.sum_point > 21
      puts "#{subject}はバーストしました。"
      if gambler.is_a?(MainPlayer) then DisplaySystem.puts_judge_outcome(:lose)
      elsif gambler.is_a?(Dealer) then DisplaySystem.puts_judge_outcome(:win)
      end
      exit
    end
  end

  def judge_continue_game(player_array, dealer)
    bool = false
    player_array.each do |player|
      if player.sum_point >= dealer.sum_point # 1人でもディーラーのポイントを上回っていれば続行
        bool = true
      end
    end
    bool
  end

  def judge_outcome(player, dealer)
    if player.sum_point > dealer.sum_point then DisplaySystem.puts_judge_outcome(:win)
    elsif player.sum_point < dealer.sum_point then DisplaySystem.puts_judge_outcome(:lost)
    elsif player.sum_point == dealer.sum_point then DisplaySystem.puts_judge_outcome(:tie)
    end
  end
end