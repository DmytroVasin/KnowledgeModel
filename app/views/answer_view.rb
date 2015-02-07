class AnswerView < UIView
  attr_accessor  :current_controller

  def initWithFrame(frame)
    super.tap do
      self.styleId = 'answer_view'

      self.addSubview( back_to_question_btn )
    end
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

      button.addTarget(current_controller, action: 'back_to_question', forControlEvents: UIControlEventTouchUpInside)
    end
  end
end
