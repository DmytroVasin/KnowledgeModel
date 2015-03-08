class AnswerView < UIView
  attr_accessor  :answer_controller

  def initWithFrame frame, text_view
    super
    self.styleId = 'answer_wrapper'

    interview_answer = InterviewView.alloc.initWithFrame(frame, text_view)
    self.addSubview( interview_answer )
    self.addSubview( back_to_question_button )
  end

  def back_to_question_button
    UIButton.buttonWithType(UIButtonTypeCustom).tap do |button|
      button.frame = [
        [self.frame.size.width/2 - 167, self.frame.size.height - 53],
        [334, 41]
      ]

      button.setTitle('Назад к вопросу', forState: UIControlStateNormal)
      button.styleClass = 'btn'

      button.autoresizingMask = button.flexible_left_right | button.flexible_top
      button.addTarget(answer_controller, action: 'dismiss_modal', forControlEvents: UIControlEventTouchUpInside)
    end
  end
end
