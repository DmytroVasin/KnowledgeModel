class QuestionController < UIViewController
  def loadView
    self.view = QuestionView.alloc.initWithFrame(UIScreen.mainScreen.bounds, load_random_question)
    self.view.current_controller = self
  end

  def viewDidLoad
    # super
  end

  def get_answer sender
    answer_controller = AnswerController.new
    answer_controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal
    answer_controller.question_id = sender.tag

    self.navigationController.presentModalViewController(answer_controller, animated: true)
  end

  def next_question
    question_controller = QuestionController.new
    self.navigationController.pushViewController(question_controller, animated: true)
  end

  private
  def load_random_question
    Question.load_by_options
  end
end
