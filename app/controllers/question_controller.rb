class QuestionViewController < UIViewController
  def loadView
    self.view = QuestionView.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    self.view.current_controller = self
  end

  def viewDidLoad
  end

  def get_answer
    answer_controller = AnswerController.alloc.init
    answer_controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal

    self.presentViewController answer_controller, animated:true, completion:nil
    # self.navigationController.pushViewController(answer_controller, animated:true)
  end

  def next_question
    questionViewController = QuestionViewController.alloc.init
    self.navigationController.pushViewController(questionViewController, animated:true)
  end
end
