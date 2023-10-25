require_relative 'lib/game'

game = Game.new
game.set_number_of_players
loop do
  game.set_chip
  game.set_environment
  game.play_turn
  game.deal_outcome
  break
end