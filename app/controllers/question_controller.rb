class QuestionViewController < UIViewController
  def loadView
    self.view = QuestionView.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    self.view.current_controller = self
  end


  def viewDidLoad
    # super
    # button = UIButton.buttonWithType UIButtonTypeRoundedRect
    # button.setTitle "Return to A", forState: UIControlStateNormal
    # button.frame = [[10, 50], [300, 50]]
    # button.addTarget(self, action: "press_button", forControlEvents: UIControlEventTouchUpInside)
    # self.view.addSubview button
  end


  def get_answer
    answer_controller = AnswerController.alloc.init
    answer_controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal
    self.presentViewController answer_controller, animated:true, completion:nil
  end

  def next_question
    puts '>>>>>>>>>>>>>>>>>>>>>>>'
    puts window
    # puts self
    puts '>>>>>>>>>>>>>>>>>>>>>>>'
    # puts self.methods
    puts '>>>>>>>>>>>>>>>>>>>>>>>'
    # puts self.navigationController
    puts '>>>>>>>>>>>>>>>>>>>>>>>'


    questionViewController = QuestionViewController.alloc.init
    self.navigationController.pushViewController(questionViewController, animated:true)
  end
end
