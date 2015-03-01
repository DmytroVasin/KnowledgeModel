class Question::Wrapper < UIView
  def initWithFrame frame, question
    super
    self.styleClass = 'main_view_wrapper'

    self.addSubview( text_question(question) )
  end

  def text_question question
    @text_question ||= UITextView.alloc.initWithFrame(CGRectZero).tap do |scroll_view|
      scroll_view.styleId = 'label_question'

      scroll_view.frame = [
        [20, 20],
        [self.frame.size.width - 40, self.frame.size.height - 40]
      ]

      scroll_view.text = question

      scroll_view.alwaysBounceVertical = false


      scroll_view.editable = false
      scroll_view.selectable = false


      scroll_view.textAlignment = UITextAlignmentCenter
      scroll_view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight
    end
  end
end
