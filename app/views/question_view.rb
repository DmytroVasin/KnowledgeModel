class QuestionView < UIView
  attr_accessor  :question_controller

  def initWithFrame frame, text_view
    super
    self.styleId = 'question_view'

    interview_question = InterviewView.alloc.initWithFrame(self.frame, text_view)

    self.addSubview( interview_question )
    self.addSubview( answer_btn )
    self.addSubview( next_question_btn )
  end

  def answer_btn
    @answer_btn ||= UIButton.buttonWithType(UIButtonTypeCustom).tap do |button|
      button.frame = [
        [20, self.frame.size.height - 53],
        [100, 41]
      ]

      button.setTitle('Ответ', forState: UIControlStateNormal)
      button.styleClass = 'btn'
      button.styleId = 'answer_btn'

      button.autoresizingMask = button.flexible_top
      button.addTarget(question_controller, action: 'get_answer_action', forControlEvents: UIControlEventTouchUpInside)
    end
  end

  def next_question_btn
    @next_question_btn ||= UIButton.buttonWithType(UIButtonTypeCustom).tap do |button|
      _start = @answer_btn.frame.size.width + 40
      _width = self.frame.size.width - _start - 20

      button.frame = [
        [_start, self.frame.size.height - 53],
        [_width, 41]
      ]

      button.setTitle('Вопрос', forState: UIControlStateNormal)
      button.styleClass = 'btn'
      button.styleId = 'next_question_btn'

      button.autoresizingMask = button.flexible_width | button.flexible_top
      button.addTarget(question_controller, action: 'next_question_action', forControlEvents: UIControlEventTouchUpInside)
    end
  end
end
