class AnswerView < UIView
  def initWithFrame(frame)
    super.tap do
      self.styleId = 'answer_view'

      addSubview( AnswerView::Wrapper.alloc.initWithFrame(
        [
          [20, 30],
          [self.frame.size.width - 40 , self.frame.size.height - 95]
        ]
      ))

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

      button.addTarget(nil, action: 'back_to_question', forControlEvents: UIControlEventTouchUpInside)
    end
  end
end
