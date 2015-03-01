class AnswerView::Wrapper < UIView
  def initWithFrame frame, answer
    super
    self.styleClass = 'main_view_wrapper'

    self.addSubview( text_answer(answer) )
  end

  def text_answer answer
    @text_answer ||= UITextView.alloc.initWithFrame(CGRectZero).tap do |scroll_view|
      scroll_view.styleId = 'label_question'

      scroll_view.frame = [
        [20, 20],
        [self.frame.size.width - 40, self.frame.size.height - 40]
      ]

      scroll_view.text = answer

      scroll_view.showsHorizontalScrollIndicator = false
      scroll_view.showsVerticalScrollIndicator = false
      scroll_view.scrollEnabled = true

      scroll_view.editable = false
      scroll_view.selectable = false


      scroll_view.textAlignment = UITextAlignmentCenter
      scroll_view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight
    end
  end
end
