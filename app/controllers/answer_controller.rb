class AnswerController < UIViewController
  def loadView
    self.view = AnswerView.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    self.view.current_controller = self
  end

  def viewDidLoad
    # super
  end

  def back_to_question
    question_controller = QuestionViewController.alloc.init
    question_controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal
    self.presentViewController question_controller, animated:true, completion:nil
  end
end
