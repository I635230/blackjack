# encoding: UTF-8
require_relative 'lib/game'

game = Game.new
game.set_number_of_players # 人数決定
game.deal_out_cards # 最初のカード処理
game.show_hand
# game.play_turn # ターン処理
# game.judge_outcome # 結果判定