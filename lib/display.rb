# frozen_string_literal: true

# display
class Display
  NAME_LIST = {
    heart: "ハート",
    spade: "スペード",
    clover: "クローバー",
    diamond: "ダイヤ"
  }


  # start


  # set_number_of_players


  # set_chip


  # set_environment


  # play_turn
  def self.show_confirm_special_effect
    puts "特殊ルールを使用しますか？(Y/n)"
  end

  def self.show_option_special_effect
    puts "使用する特殊ルールを選択してください(sr/dd/sp/n)"
  end

  # deal_outcome
  def show_final_chip(player, hand, i)
    case hand.outcome
    when :win then puts "#{player.subject}の手札#{i}が勝利したので、がベットした#{hand.bet}枚の1.5倍を払い戻し、所持チップ数は#{player.chip.to_i}枚となります。"
    when :lose then puts "#{player.subject}の手札#{i}が敗北したので、ベットした#{hand.bet}枚は失われ、所持チップ数は#{player.chip}枚となります。"
    when :tie then puts "#{player.subject}の手札#{i}が引き分けなので、ベットした#{hand.bet}枚を払い戻し、所持チップ数は#{player.chip}枚となります。"
    when :surrender then puts "#{player.subject}の手札#{i}がサレンダーしたので、ベットした#{hand.bet}枚の半分を払い戻し、所持チップ数は#{player.chip.to_i}枚となります。"
    end
  end

  # end


  private
    def puts_line
      puts "--------------------------------------------------------------"
    end





  # def self.show_select_number_of_players
  #   puts_line
  #   puts "プレーヤーの人数を選択してください。(1/2/3)"
  # end

  # def self.show_start_message(number) # TODO: 人数に制限をつける。それはDisplaySystemの外でやる
  #   puts "-----------------------------------------------------"
  #   puts "#{number}人が選択されました。プレーヤー#{number}人とディーラーで進行してきます。"
  #   puts "それでは、ブラックジャックを開始します。"
  #   puts_line
  # end

  # def self.show_end_message
  #   puts "ブラックジャックを終了します。"
  #   puts_line
  # end

  # def self.show_set_chip(player)
  #   puts "あなたの所持チップは#{player.chip}枚です。ベットする枚数を決めてください。"
  # end

  # def self.show_hands(gambler_array)
  #   gambler_array.each do |gambler|
  #     cards = gambler.hand.cards
  #     cards.each_with_index do |card, i|
  #       times = i+1
  #       if gambler.is_a?(Dealer) && times == 2
  #         puts "#{gambler.subject}の#{times}番目に引いたカードはわかりません。"
  #       else
  #         puts "#{gambler.subject}の#{times}番目に引いたカードは#{NAME_LIST[card.suit]}の#{card.number}です。"
  #       end
  #     end
  #   puts_line
  #   end
  # end

  # def self.show_confirm_double_down(gambler)
  #   puts "#{gambler.subject}はダブルダウンしますか？"
  # end

  # def self.show_confirm_surrender(gambler)
  #   puts "#{gambler.subject}はサレンダーしますか？"
  # end

  # def self.show_decision_surrender(gambler)
  #   puts "#{gambler.subject}はサレンダーしました。"
  # end

  # def self.show_point(gambler)
  #   print "#{gambler.subject}の現在の得点は#{gambler.point}点です。"
  # end

  # def self.show_confirm_continue
  #   puts "カードを引きますか？(Y/n)"
  #   puts_line
  # end

  # def self.new_line
  #   print "\n"
  #   puts_line
  # end

  # def self.show_drawing_a_card(card, gambler)
  #   puts "#{gambler.subject}は#{NAME_LIST[card.suit]}の#{card.number}を引いた。"
  # end

  # def self.show_burst(gambler)
  #   puts "#{gambler.subject}はバーストしたので、ターンを終了します。"
  #   puts_line
  # end

  # def self.show_yn
  #   puts "Yかnを入力してください。"
  # end

  # def self.show_123
  #   puts "1, 2, 3のいずれかを入力してください。"
  # end

  # def self.show_number_range
  #   puts "10以上100以下の整数を入力してください。"
  # end

  # def self.show_final_point(gambler_array)
  #   gambler_array.each do |gambler|
  #     puts "#{gambler.subject}の最終得点は#{gambler.point}点です。"
  #   end
  #   puts_line
  # end
end
