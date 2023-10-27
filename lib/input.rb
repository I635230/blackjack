# encoding: UTF-8
# frozen_string_literal: true

require_relative "display"

# input
module Input
  include Display

  def input_number_of_players
    input = gets.chomp
    case input
    when '1' then input.to_i
    when '2' then input.to_i
    when '3' then input.to_i
    else
      show_123
      input_number_of_players
    end
  end

  def input_bet
    input = gets.to_i
    if input >= 1 && input <= 1000
      input
    else
      show_number_range
      input_bet
    end
  end

  def input_special_effect
    case gets.chomp.downcase
    when "sr" then :surrender
    when "dd" then :double_down
    when "sp" then :split
    when "n" then false
    else
      show_special
      input_special_effect
    end
  end


  def input_judge_continue
    input_yn
  end

  def input_confirm_special
    input_yn
  end

  def input_confirm_continue
    input_yn
  end

  private
    def input_yn
      input = gets.chomp.downcase
      case input
      when 'y' then true
      when 'n' then false
      else
        show_yn
        input_yn
      end
    end
end
