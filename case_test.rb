# is_a?とかいらなくて、これで判定できるっぽい。
def subject_branch(gambler)
  case gambler
  when MainPlayer then 'あなた'
  when CPUPlayer then 'CPUプレーヤー'
  when Dealer then 'ディーラー'
  else
    'エラー！'
  end
end

require './gambler'
require './player'
require './main_player'
require './cpu_player'
require './dealer'
require './blackjack_system'

gambler = MainPlayer.new

puts subject_branch(gambler)