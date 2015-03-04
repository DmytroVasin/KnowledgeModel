class AnswerView < UIView
  attr_accessor  :answer_controller

  def initWithFrame frame, answer
    # For what reason we put super?
    super
    self.styleId = 'answer_view'

    answer_wrapper = AnswerView::Wrapper.alloc.initWithFrame(
      [
        [20, 30],
        [self.frame.size.width - 40, self.frame.size.height - 95]
      ], answer
    )
    answer_wrapper.autoresizingMask = answer_wrapper.flexible_width_height

    self.addSubview( answer_wrapper )
    self.addSubview( back_to_question_btn )
  end

  def back_to_question_btn
    UIButton.buttonWithType(UIButtonTypeCustom).tap do |button|
      button.frame = [
        [self.frame.size.width/2 - 150, self.frame.size.height - 55],
        [300, 40]
      ]

      button.setTitle('Назад к вопросу', forState: UIControlStateNormal)
      button.styleId = 'back_to_question_btn'
      button.styleClass = 'btn'

      button.autoresizingMask = button.flexible_left_right | button.flexible_top | button.flexible_width

      button.addTarget(answer_controller, action: 'dismiss_view', forControlEvents: UIControlEventTouchUpInside)
    end
  end
end
