require_relative 'input'
# require_relative 'deck'
# require_relative 'point'
# require_relative 'chip'
# require_relative 'effect'
# require_relative 'outcome'
require_relative 'main_player'
require_relative 'cpu_player'
require_relative 'dealer'

class Game
  def initialize
    make_basic_instance
  end

  def set_number_of_players
    @number_of_players = @input.input_number_of_players
    set_other_varibale
    make_gambler_instance
  end

  def set_chip
  #   @player_array.each do |player|
  #     player.set_bet(@input.input_bet)
  #   end
  end

  def set_environment
  #   @deck.make_deck
  #   @deck.shuffle
  #   @deck.deal_out(@gambler_array)
  end

  def play_turn
  #   @gambler_array.each do |gambler|
  #     @effect.special_effect(gambler) if gambler.is_a?(MainPlayer)
  #     @point.calculate(gambler)
  #     loop do
  #       break if gambler.outcome == :surrender
  #       break unless gambler.judge_continue
  #       @deck.draw_add(gambler)
  #       @point.calculate(gambler)
  #       break if @effect.confirm_bust(gambler)
  #     end
  #   end
  end

  def deal_outcome
  #   @player_array.each do |player|
  #     @outcome.set_outcome(player, @dealer)
  #     @chip.process_chip(player)
  #     puts "#{player.subject}, #{player.hand.cards}, #{player.hand_second.cards}"
  #     # Display.show_final_chip(player)
  #   end
  #   puts "#{@dealer.subject}, #{@dealer.outcome}, #{@dealer.hand.cards}"
  end

  # private

  def make_basic_instance
    @input = Input.new
  #   @deck = Deck.new
  #   @point = Point.new
  #   @chip = Chip.new
  #   @effect = Effect.new
  #   @outcome = Outcome.new
  end

  def set_other_varibale
    @number_of_cpu_players = @number_of_players - 1
    @number_of_gamblers = @number_of_players + 1
  end

  def make_gambler_instance
    @player1 = MainPlayer.new
    @player2 = CPUPlayer.new
    @player3 = CPUPlayer.new
    @dealer = Dealer.new
    set_gambler_array
    set_player_array
  end

  def set_gambler_array
    @gambler_array = case @number_of_gamblers
                     when 2 then [@player1, @dealer]
                     when 3 then [@player1, @player2, @dealer]
                     when 4 then [@player1, @player2, @player3, @dealer]
                     end
  end

  def set_player_array
    @player_array = @gambler_array.slice(0, @number_of_players)
  end
end