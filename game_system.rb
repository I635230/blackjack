# encoding: UTF-8
# frozen_string_literal: true

class GameSystem
  attr_reader :number_of_gamblers, :number_of_players, :number_of_cpu_players, :gambler_array
  def initialize
  end

  def set_number_of_players=(number_of_players)
    @number_of_gamblers = number_of_players + 1
    @number_of_players = number_of_players
    @number_of_cpu_players = number_of_players - 1
  end

  def set_gambler_array(all_gambler_array)
    # TODO: if文をコンパクトに
    @player1 = all_gambler_array[0]
    @player2 = all_gambler_array[1]
    @player3 = all_gambler_array[2]
    @dealer = all_gambler_array[3]
    if @number_of_gamblers == 1
      @gambler_array = [@player1, @dealer]
    elsif @number_of_gamblers == 2
      @gambler_array = [@player1, @player2, @dealer]
    elsif @number_of_gamblers == 3
      @gambler_array = [@player1, @player2, @player3, @dealer]
    end
  end
end