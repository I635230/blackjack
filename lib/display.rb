# encoding: UTF-8
# frozen_string_literal: true

module Display
  NAME_LIST = {
    heart: 'ハート', 
    spade: 'スペード', 
    colver: 'クローバー', 
    diamond: 'ダイヤ'
  }

  # def set_gambler_array=(gambler_array)
  #   @gambler_array = gambler_array
  # end

  def self.show_select_number_of_players
    puts '-----------------------------------------------------'
    puts 'プレーヤーの人数を選択してください。(1/2/3)'
  end

  def self.show_start_message(number) # TODO: 人数に制限をつける。それはDisplaySystemの外でやる
    puts '-----------------------------------------------------'
    puts "#{number}人が選択されました。プレーヤー#{number}人とディーラーで進行してきます。"
    puts 'それでは、ブラックジャックを開始します。'
    puts '-----------------------------------------------------'
  end

  # def show_end_message
  #   puts 'ブラックジャックを終了します。'
  #   puts '-----------------------------------------------------'
  # end

  def self.show_hands(gambler_array)
    gambler_array.each do |gambler|
      hand = gambler.hand
      hand.each_with_index do |hand_i, i|
        symbol, number = hand_i
        times = i+1
        if gambler.is_a?(Dealer) && times == 2
          puts "#{gambler.subject}の#{times}番目に引いたカードはわかりません。" 
        else
          puts "#{gambler.subject}の#{times}番目に引いたカードは#{NAME_LIST[symbol]}の#{number}です。"
        end
      end
      puts '-----------------------------------------------------'
    end
  end

  # def show_point(gambler)
  #   puts "#{gambler.subject}の現在の得点は#{gambler.point}です。"
  # end

  # def show_confirm_continue
  #   puts "カードを引きますか？(Y/n)"
  # end

  # def show_drawing_a_card(card, gambler)
  #   symbol, number = card
  #   puts "#{gambler.subject}は#{NAME_LIST[symbol]}の#{number}を引いた。"
  # end

  # def show_final_point
  #   @gambler_array.each do |gambler|
  #     puts "#{gambler.subject}の得点は#{gambler.point}点です。"
  #   end
  #   puts '-----------------------------------------------------'
  # end
end