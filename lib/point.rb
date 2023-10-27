# encoding: UTF-8
# frozen_string_literal: true

require_relative "display"

# point
class Point
  include Display

  def calculate(hand)
    point_list = [0]
    hand.cards.each do |card|
      tmp_point_list = []
      point_list.each do |point|
        if card.number == "A"
          tmp_point_list.push(point + 1)
          tmp_point_list.push(point + 11)
        else
          tmp_point_list.push(point + convert_point(card.number))
        end
      end
      point_list = tmp_point_list
    end
    hand.set_point = max_point(point_list)
  end

  def max_point(point_list)
    max_point = 0
    point_list.each do |point|
      max_point = [max_point, point].max unless point > 21
    end
    max_point = point_list.min if max_point.zero?
    max_point
  end

  def convert_point(number)
    return 10 if %w[J Q K].include?(number)
    number.to_i
  end

  def deal_bust(hand)
    if hand.point > 21
      hand.set_outcome = :lose
      show_bust
      true
    else
      false
    end
  end
end
