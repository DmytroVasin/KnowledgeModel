class AnswerView::Wrapper < UIView
  def initWithFrame frame, answer
    super
    self.styleClass = 'main_view_wrapper'

    self.addSubview( label_question(answer) )
  end

  def label_question answer
    @label_question ||= UILabel.alloc.initWithFrame(CGRectZero).tap do |label|
      label.lineBreakMode = UILineBreakModeWordWrap
      label.numberOfLines = 0
      label.sizeToFit

      label.frame = [
        [20, 20],
        [300, self.frame.size.height - 40]
      ]

      label.styleId = 'label_question'
      label.text = answer

      label.font = UIFont.fontWithName("Inconsolata", size: 30)
      label.textAlignment = UITextAlignmentCenter
      # label.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin
    end
  end
end
