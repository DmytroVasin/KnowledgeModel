class AnswerController < UIViewController
  def loadView
    self.view = AnswerView.alloc.initWithFrame(UIScreen.mainScreen.bounds)
  end

  def viewDidLoad
    # super
  end

  def back_to_question
    question_controller = QuestionViewController.alloc.init
    question_controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal

    self.dismissModalViewControllerAnimated(true)
  end
end
