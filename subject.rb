# encoding: UTF-8
# frozen_string_literal: true

module Subject
  def subject_branch(gambler)
    case gambler
    when MainPlayer then 'あなた'
    when CPUPlayer then 'CPUプレーヤー'
    when Dealer then 'ディーラー'
    end
  end
end