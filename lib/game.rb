require_relative 'main_player'
require_relative 'cpu_player'
require_relative 'dealer'
require_relative 'card'
require_relative 'deck'
require_relative 'hand'
require_relative 'point'

require_relative 'display'
require_relative 'input'

class Game
  # attr_reader :number_of_players, :number_of_gamblers, :number_of_cpu_players, :gambler_array

  def initialize
    @player1 = MainPlayer.new
    @player2 = CPUPlayer.new
    @player3 = CPUPlayer.new
    @dealer = Dealer.new
    @deck = Deck.new
  end

  def deal_number_of_players
    Display.show_select_number_of_players
    set_number_of_players
    Display.show_start_message(@number_of_players)
  end

  def set_number_of_players
    @number_of_players = 3
    # @number_of_players = Input.input_number_of_players
    @number_of_gamblers = @number_of_players+1
    @number_of_cpu_players = @number_of_players-1
    case @number_of_gamblers
    when 2 then @gambler_array = [@player1, @dealer]
    when 3 then @gambler_array = [@player1, @player2, @dealer]
    when 4 then @gambler_array = [@player1, @player2, @player3, @dealer]
    end
  end

  def deal_out_cards
    2.times do
      @gambler_array.each do |gambler|
        gambler.hand.add_card(@deck.draw)
      end
    end
  end

  def play_turn
    @gambler_array.each do |gambler|
      loop do
        break unless gambler.judge_continue
      end
    end
  end

  def judge_outcome

  end

  # def show_hand
  #   @player1.hand.cards.each do |card|
  #     p card.card
  #   end
  # end
end