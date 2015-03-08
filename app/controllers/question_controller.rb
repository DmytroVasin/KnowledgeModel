class QuestionController < InterviewController
  def viewWillDisappear animated
    set_content_size @interview_view
  end

  def viewWillAppear animated
    set_content_size @interview_view
  end

  def loadView
    self.automaticallyAdjustsScrollViewInsets = false

    self.view = QuestionView.alloc.initWithFrame(UIScreen.mainScreen.bounds, interview_view(random_question.question))
    self.view.question_controller = self

    self.view.swipe(:left){ next_question_action }
    self.view.swipe(:up){ setup_action }
    self.view.swipe(:right){ get_answer_action }
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
