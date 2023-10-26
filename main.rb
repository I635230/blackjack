# encoding: UTF-8
# frozen_string_literal: true

require_relative "lib/game"

game = Game.new
game.set_number_of_players
loop do
  game.set_chip
  game.set_environment
  game.play_turn
  game.deal_outcome
  break unless game.confirm_continue
end
