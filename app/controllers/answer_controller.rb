class AnswerController < InterviewController
  attr_accessor :answer

  def loadView
    self.view = AnswerView.alloc.initWithFrame(UIScreen.mainScreen.bounds, text_answer_view)
    self.view.answer_controller = self

    self.view.swipe(:right){ dismiss_modal }
  end

  def text_answer_view
    @text_answer_view ||= UITextView.alloc.initWithFrame(CGRectZero).tap do |scroll_view|
      scroll_view.styleId = 'label_question'

      scroll_view.text = prepare_question_text(self.answer)
      scroll_view.frame = task_bounds(UIScreen.mainScreen.bounds)

      scroll_view.showsHorizontalScrollIndicator = false
      scroll_view.showsVerticalScrollIndicator = false
      scroll_view.scrollEnabled = true

      scroll_view.editable = false
      scroll_view.selectable = false

      scroll_view.addObserver(self, forKeyPath: 'contentSize', options: NSKeyValueObservingOptionNew, context: nil)
      scroll_view.autoresizingMask = scroll_view.flexible_width_height
    end
  end
end
