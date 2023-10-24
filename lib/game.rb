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
  def initialize
    @player1 = MainPlayer.new
    @player2 = CPUPlayer.new
    @player3 = CPUPlayer.new
    @dealer = Dealer.new
    @deck = Deck.new
    @point = Point.new
  end

  def deal_chip
    @player_array.each do |player|
      Display.show_set_chip(player) if player.is_a?(MainPlayer)
      player.set_chip
    end
  end

  def deal_number_of_players
    Display.show_select_number_of_players
    set_number_of_players
    Display.show_start_message(@number_of_players)
  end

  def set_number_of_players
    @number_of_players = Input.input_number_of_players
    @number_of_gamblers = @number_of_players+1
    @number_of_cpu_players = @number_of_players-1
    case @number_of_gamblers
    when 2 then @gambler_array = [@player1, @dealer]
    when 3 then @gambler_array = [@player1, @player2, @dealer]
    when 4 then @gambler_array = [@player1, @player2, @player3, @dealer]
    end
    @player_array = @gambler_array.slice(0, @number_of_players)
  end

  def deal_out_cards
    2.times do
      @gambler_array.each do |gambler|
        gambler.hand.add_card(@deck.draw)
      end
    end
    Display.show_hands(@gambler_array)
  end

  def play_turn
    @gambler_array.each do |gambler|
      if gambler.is_a?(MainPlayer)
        if deal_surrender(gambler)
          next
        end

        if deal_double_down(gambler)
          gambler.change_chip
          gambler.on_draw_restriction
        end
      end
      loop do
        # show_hand(gambler)
        gambler.set_point=(@point.calculate_point(gambler))
        Display.show_point(gambler)
        break if deal_burst(gambler)
        break if gambler.draw_restriction && gambler.hand.draw_count >= 3
        gambler.is_a?(MainPlayer) ? Display.show_confirm_continue : Display.new_line
        break unless gambler.judge_continue
        card = @deck.draw
        gambler.hand.add_card(card)
        Display.show_drawing_a_card(card, gambler)
      end
    end
  end

  def deal_surrender(gambler)
    Display.show_confirm_surrender(gambler)
    if Input.input_surrender
      gambler.set_outcome = :surrender
      Display.show_decision_surrender(gambler)
      return true
    end
    false
  end

  def deal_double_down(gambler)
    Display.show_confirm_double_down(gambler)
    if Input.input_double_down
      return true
    end
    false
  end

  def deal_burst(gambler)
    if @point.judge_burst(gambler)
      gambler.set_outcome = :lose
      Display.show_burst(gambler)
      return true
    end
    false
  end

  def judge_outcome
    confirm_outcome
    calculate_chip
    Display.show_final_point(@gambler_array)
    Display.show_final_chip(@player_array)
    Display.show_end_message
  end

  def confirm_outcome
    @player_array.each do |player|
      next if player.outcome == :lose
      next if player.outcome == :surrender
      if @dealer.outcome == :lose
        player.set_outcome = :win
        next
      end
      if player.point > @dealer.point then player.set_outcome = :win
      elsif player.point < @dealer.point then player.set_outcome = :lose
      else 
        player.set_outcome = :tie
      end
    end
  end

  def calculate_chip
    @player_array.each do |player|
      case player.outcome
      when :win then player.add_chip(player.bet * 1.5)
      when :tie then player.add_chip(player.bet)
      when :surrender then player.add_chip(player.bet * 0.5)
      end
    end
  end

  # def show_hand(gambler)
  #   gambler.hand.cards.each do |card|
  #     p card.card
  #   end
  # end
end