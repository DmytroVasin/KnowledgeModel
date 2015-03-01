class QuestionView < UIView
  attr_accessor  :question_controller

  def initWithFrame frame, question
    super
    self.styleId = 'question_view'

    question_wrapper = Question::Wrapper.alloc.initWithFrame(
      [
        [20, 30],
        [self.frame.size.width - 40, self.frame.size.height - 95]
      ], question
    ).tap{ |subview|
      subview.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight
    }

    self.addSubview( question_wrapper )
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

      button.autoresizingMask = UIViewAutoresizingFlexibleTopMargin
      button.addTarget(question_controller, action: 'get_answer', forControlEvents: UIControlEventTouchUpInside)
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

      button.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin

      button.addTarget(question_controller, action: 'next_question_action', forControlEvents: UIControlEventTouchUpInside)
    end
  end
end
