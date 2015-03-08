class QuestionController < InterviewController
  def viewWillDisappear animated
    set_content_size text_question_view
  end

  def viewWillAppear animated
    set_content_size text_question_view
  end

  def loadView
    self.automaticallyAdjustsScrollViewInsets = false

    self.view = QuestionView.alloc.initWithFrame(UIScreen.mainScreen.bounds, text_question_view)
    self.view.question_controller = self

    self.view.swipe(:left){ next_question_action }
    self.view.swipe(:up){ setup_action }
    self.view.swipe(:right){ get_answer_action }
  end

  def text_question_view
    @text_question_view ||= UITextView.alloc.initWithFrame(CGRectZero).tap do |scroll_view|
      scroll_view.styleId = 'label_question'

      scroll_view.text = prepare_question_text(random_question.question)
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

  def get_answer_action
    answer_controller = AnswerController.new
    answer_controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal
    answer_controller.answer = random_question.answer

    show_modal(answer_controller)
  end

  private
  def random_question
    @random_question ||= Question.load_by_options
  end
end
