class AnswerView::Wrapper < UIView
  def initWithFrame frame, question_id
    super.tap do
      self.styleClass = 'main_view_wrapper'

      addSubview( label_question(question_id) )
    end
  end

  def label_question id
    @label_question ||= UILabel.alloc.initWithFrame(CGRectZero).tap do |label|
      label.lineBreakMode = UILineBreakModeWordWrap
      label.numberOfLines = 0
      label.sizeToFit

      label.frame = [
        [20, 20],
        [300, self.frame.size.height - 40]
      ]

      label.styleId = 'label_question'
      label.text = Question.identify(id)

      label.font = UIFont.fontWithName("Inconsolata", size: 30)
      label.textAlignment = UITextAlignmentCenter
      # label.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin
    end
  end
end
