class Question::Wrapper < UIView
  def initWithFrame frame, question
    super
    self.styleClass = 'main_view_wrapper'

    self.addSubview( label_question(question) )
  end

  def label_question question
    @label_question ||= UILabel.alloc.initWithFrame(CGRectZero).tap do |label|
      label.lineBreakMode = UILineBreakModeWordWrap
      label.numberOfLines = 0
      label.sizeToFit

      label.frame = [
        [20, 20],
        [self.frame.size.width - 40, self.frame.size.height - 40]
      ]

      label.styleId = 'label_question'
      label.text = question

      # TODO: remove into css.
      label.font = UIFont.fontWithName("Inconsolata", size: 30)
      label.textAlignment = UITextAlignmentCenter
      label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight
    end
  end
end
