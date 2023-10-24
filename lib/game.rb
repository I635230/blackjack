require_relative 'main_player'
require_relative 'cpu_player'
require_relative 'dealer'
require_relative 'card'
require_relative 'deck'
require_relative 'hand'
require_relative 'display'

class Game
  def initialize
    @display = Display.new
    @player1 = MainPlayer.new
    @player2 = CPUPlayer.new
    @player3 = CPUPlayer.new
    @dealer = Dealer.new
    @deck = Deck.new
  end

  def set_number_of_players
    @set_number_of_players = 2
    @gambler_array = [@player1, @player2, @dealer]
  end

  def deal_out_cards
    2.times do
      @gambler_array.each do |gambler|
        gambler.hand.add_card(@deck.draw)
      end
    end
  end

  def play_turn
  end

  def judge_outcome

  end

  def show_hand
    @player1.hand.cards.each do |card|
      p card.card
    end
  end
end