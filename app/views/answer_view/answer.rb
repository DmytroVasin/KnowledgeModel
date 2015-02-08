class AnswerView::Wrapper < UIView
  def initWithFrame(frame)
    super.tap do
      self.styleClass = 'main_view_wrapper'

      addSubview( label_question )
    end
  end

  def label_question
    @label_question ||= UILabel.alloc.initWithFrame(CGRectZero).tap do |label|
      label.lineBreakMode = UILineBreakModeWordWrap
      label.numberOfLines = 0
      label.sizeToFit

      label.frame = [
        [20, 20],
        [300, self.frame.size.height - 40]
      ]

      label.styleId = 'label_question'
      label.text = 'hecks for the iPad, and so will allow all four rotations when an ipad is used, but we are not checking for the ipad when we calculate our width/height. We should! Using'

      label.font = UIFont.fontWithName("Inconsolata", size: 30)
      label.textAlignment = UITextAlignmentCenter
      # label.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin
    end
  end
end
