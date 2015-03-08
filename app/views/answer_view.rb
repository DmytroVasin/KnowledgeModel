class AnswerView < UIView
  attr_accessor  :answer_controller

  def initWithFrame frame, text_view
    super
    self.styleId = 'answer_view'

    interview_answer = InterviewView.alloc.initWithFrame(frame, text_view)

    self.addSubview( interview_answer )
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
      button.addTarget(answer_controller, action: 'dismiss_modal', forControlEvents: UIControlEventTouchUpInside)
    end
  end
end
