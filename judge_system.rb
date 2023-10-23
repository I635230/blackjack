class JudgeSystem
  def judge_continue(bool_confirm_continue, input_manager, judge_system)
    case bool_confirm_continue
    when 'y'
      true
    when 'n'
      false
    else
      bool_confirm_continue = input_manager.input_confirm_continue
      judge_system.judge_continue(bool_confirm_continue, input_manager, judge_system) # TODO: もう一度入力的な文章を出力
    end
  end

  def judge_outcome(gambler_array)
  end
end