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
    JWButton.default_button('Назад к вопросу',
      action: 'dismiss_modal',
      frame: self.frame,
      controller: answer_controller
    )
  end
end
