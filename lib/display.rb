# encoding: UTF-8
# frozen_string_literal: true

# display
module Display
  NAME_LIST = {
    heart: "ハート",
    spade: "スペード",
    clover: "クローバー",
    diamond: "ダイヤ"
  }

  # -------------------------------------------------------------------------------------------------
  # set_number_of_players
  def show_select_number_of_players
    puts_line
    puts "プレーヤーの人数を選択してください。(1/2/3)"
  end

  def show_start_message(number) # TODO: 人数に制限をつける。それはDisplaySystemの外でやる
    puts "-----------------------------------------------------"
    puts "#{number}人が選択されました。プレーヤー#{number}人とディーラーで進行してきます。"
    puts "それでは、ブラックジャックを開始します。"
    puts_line
  end

  # -------------------------------------------------------------------------------------------------
  # set_bet
  def show_set_bet(player)
    puts "あなたの所持チップは#{player.chip}枚です。ベットする枚数を決めてください。(1以上1000以下の整数)"
  end

  # -------------------------------------------------------------------------------------------------
  # play_turn
  def show_hands(gambler_array)
    gambler_array.each do |gambler|
      cards = gambler.hands[0].cards
      cards.each_with_index do |card, i|
        times = i+1
        if gambler.is_a?(Dealer) && times == 2
          puts "#{gambler.subject}の#{times}番目に引いたカードはわかりません。"
        else
          puts "#{gambler.subject}の#{times}番目に引いたカードは#{NAME_LIST[card.suit]}の#{card.number}です。"
        end
      end
    puts_line
    end
  end

  def show_dealer_hand_second(dealer)
    hand = dealer.hands[0]
    suit, number = hand.cards[1].suit, hand.cards[1].number
    puts "#{dealer.subject}の引いた2枚目のカードは#{NAME_LIST[suit]}の#{number}でした。"
  end

  def show_point(gambler, hand)
    print "#{gambler.subject}の現在の得点は#{hand.point}点です。"
  end

  def show_confirm_continue
    puts "カードを引きますか？(Y/n)"
    puts_line
  end

  def new_line
    print "\n"
    puts_line
  end

  def show_drawing_a_card(card, gambler)
    puts "#{gambler.subject}は#{NAME_LIST[card.suit]}の#{card.number}を引いた。"
  end

  ## effect
  def show_confirm_special_effect
    puts "特殊ルールを使用しますか？(Y/n)"
  end

  def show_option_special_effect
    puts "使用する特殊ルールを選択してください(sr/dd/sp/n)"
  end

  def show_lack_chip(special_rule)
    puts "チップが不足しているため、#{special_rule}は行えません。"
  end

  def show_not_match
    puts "番号が一致していないため、スプリットは行えません。"
  end

  def show_decision_surrender(gambler)
    puts "#{gambler.subject}はサレンダーしました。"
  end

  ## point
  def show_bust
    puts "バーストしたので、ターンを終了します。"
    puts_line
  end

  # -------------------------------------------------------------------------------------------------
  # deal_outcome
  def show_final_chip(player, hand, i)
    case hand.outcome
    when :win then puts "#{player.subject}は手札#{i}で勝利したので、ベットした#{hand.bet}枚の1.5倍を払い戻し、所持チップ数は#{player.chip.to_i}枚となります。"
    when :lose then puts "#{player.subject}は手札#{i}で敗北したので、ベットした#{hand.bet}枚は失われ、所持チップ数は#{player.chip}枚となります。"
    when :tie then puts "#{player.subject}は手札#{i}で引き分けたので、ベットした#{hand.bet}枚を払い戻し、所持チップ数は#{player.chip}枚となります。"
    when :surrender then puts "#{player.subject}は手札#{i}でサレンダーしたので、ベットした#{hand.bet}枚の半分を払い戻し、所持チップ数は#{player.chip.to_i}枚となります。"
    end
  end

  # -------------------------------------------------------------------------------------------------
  # end

  def show_final_point(gambler_array)
    gambler_array.each do |gambler|
      gambler.hands.each_with_index do |hand, i|
        puts "#{gambler.subject}の手札#{i+1}の最終得点は#{hand.point}点です。"
      end
    end
    puts_line
  end

  def show_confirm_continue_game
    puts "ゲームを続けますか？(Y/n)"
    puts_line
  end

  private
    def puts_line
      puts "--------------------------------------------------------------"
    end






  # def self.show_end_message
  #   puts "ブラックジャックを終了します。"
  #   puts_line
  # end


  def show_yn
    puts "Yかnを入力してください。"
  end

  def show_123
    puts "1, 2, 3のいずれかを入力してください。"
  end

  def show_special
    puts "sr, dd, sp, nのいずれかを入力してください。"
  end

  def show_number_range
    puts "1以上1000以下の整数を入力してください。"
  end
end
