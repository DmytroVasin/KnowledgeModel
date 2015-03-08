class AnswerView < UIView
  attr_accessor  :answer_controller

  def initWithFrame frame, text_view
    super
    self.styleId = 'answer_view'

    answer_wrapper = AnswerView::Wrapper.alloc.initWithFrame(
      [
        [20, 30],
        [self.frame.size.width - 40, self.frame.size.height - 95]
      ]
    ).tap{ |subview|
      subview.autoresizingMask = subview.flexible_width_height
      subview.addSubview(text_view)
    }

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

      button.addTarget(answer_controller, action: 'dismiss_modal', forControlEvents: UIControlEventTouchUpInside)
    end
  end
end
