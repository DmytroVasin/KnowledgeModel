class AnswerController < UIViewController
  attr_accessor :question_id

  def loadView
    self.view = AnswerView.alloc.initWithFrame(UIScreen.mainScreen.bounds, self.question_id)
  end

  def viewDidLoad
    # super
  end

  def back_to_question
    question_controller = QuestionController.alloc.init
    question_controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal

    self.dismissModalViewControllerAnimated(true)
  end
end
