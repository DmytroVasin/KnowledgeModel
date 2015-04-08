class InterviewController < ApplicationController
  include ContentObserver

  def interview_view text
    @interview_view ||= UITextView.alloc.initWithFrame(CGRectZero).tap do |scroll_view|
      scroll_view.styleId = 'interview_task'
      scroll_view.styleClass = 'label'

      scroll_view.text = prepare_question_text(text)
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

  private
  def task_bounds bound
    [
      [bound.origin.x + 20, bound.origin.y + 20],
      [bound.size.width - 80, bound.size.height - 135]
    ]
  end

  def prepare_question_text question
    # NOTE: 80 - magic number, because observer of the text_view is not trigger,
    # when length is lower then one displayed string.
    question.length < 80 ? "\n#{question}\n" : question
  end
end
