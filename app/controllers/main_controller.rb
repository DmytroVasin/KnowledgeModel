class MainController < UIViewController
  def loadView
    self.view = MainView.alloc.initWithFrame(UIScreen.mainScreen.bounds)
  end

  def viewDidLoad
    # super
  end

  def start_testing
    question_controller = QuestionController.alloc.init
    self.navigationController.pushViewController(question_controller, animated: true)
  end
end
