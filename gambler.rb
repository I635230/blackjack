# encoding: UTF-8
# frozen_string_literal: true

class Gambler
  attr_accessor :hand, :sum_point
 
  def initialize
    @hand = []
    @sum_point = 0
  end
end