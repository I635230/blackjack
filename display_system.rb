# encoding: UTF-8
# frozen_string_literal: true

require './subject'

class DisplaySystem
  include Subject

  def initialize
    @correspondence_table = {
      'heart' => 'ハート',
      'clover' => 'クローバー',
      'spade' => 'スペード',
      'diamond' => 'ダイヤモンド'
    }
  end

  def self.send_start_messages
    puts 'プレーヤーの数を選んでください。最大3人までプレイ可能です。あなた以外のプレーヤーはCPUになります。'
    puts '1人プレイが選択されました。'
    puts 'それでは、ブラックジャックを開始します。'
  end

  def self.send_end_messages
    puts 'ブラックジャックを終了します。'
  end

  def self.puts_line
    puts '-----------------------------------------------------'
  end

  def show_drawing_a_card(card, gambler)
    symbol, number = card
    subject = subject_branch(gambler)
    puts "#{subject}の引いたカードは#{@correspondence_table[symbol]}の#{number}です。"
  end

  def show_player_hand(player)
    player.hand.each do |hand_i|
      symbol, number = hand_i
      puts "あなたの引いたカードは#{@correspondence_table[symbol]}の#{number}です。"
    end
  end

  def show_dealer_hand(dealer)
    dealer.hand.each_with_index do |hand_i, i|
      if i >= 1
        puts 'ディーラーの引いた2枚目のカードはわかりません。'
      else
        symbol, number = hand_i
        puts "ディーラーの引いたカードは#{@correspondence_table[symbol]}の#{number}です。"
      end
    end
  end

  def show_dealer_hand_second(dealer)
    symbol, number = dealer.hand[1]
    puts "ディーラーの引いた2枚目のカードは#{@correspondence_table[symbol]}の#{number}でした。"
  end

  def confirm_draw_a_card(player)
    puts "カードを引きますか？(Y/N)"
  end

  def show_sum_point(gambler)
    subject = subject_branch(gambler)
    puts "#{subject}の現在の得点は#{gambler.sum_point}です。"
  end

  def puts_dealer_exceed
    puts 'ディーラーが全プレーヤーの点数を上回りました。'
  end

  def self.puts_judge_outcome(outcome)
    case outcome
    when :win then puts 'あなたの勝利です！'
    when :lose then puts 'あなたの敗北です...'
    when :tie then puts '惜しい！引き分けです。'
    end
  end
end