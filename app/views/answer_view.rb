class AnswerView < UIView
  attr_accessor  :answer_controller

  def initWithFrame frame, question_id
    # For what reason we put super?
    super
    self.styleId = 'answer_view'

    self.addSubview( AnswerView::Wrapper.alloc.initWithFrame(
      [
        [20, 30],
        [self.frame.size.width - 40 , self.frame.size.height - 95]
      ], question_id
    ))
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

      button.addTarget(answer_controller, action: 'back_action', forControlEvents: UIControlEventTouchUpInside)
    end
  end
end
