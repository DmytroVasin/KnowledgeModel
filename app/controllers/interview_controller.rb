class InterviewController < ApplicationController
  include ContentObserver

  def interview_view text
    @interview_view ||= UITextView.alloc.initWithFrame(CGRectZero).tap do |scroll_view|
      scroll_view.styleId = 'interview_task'

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
    # NOTE: 50 - magic number, because observer of the text_view is not trigger,
    # when length is lower then one displayed string.
    question.length < 50 ? "\n#{question}\n" : question

    "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?"
  end
end
