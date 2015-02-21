class MainController < UIViewController
  def loadView
    self.view = MainView.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    self.view.main_controller = self
  end

  def viewDidLoad
  end

  def start_testing
    question_controller = QuestionController.new
    self.navigationController.pushViewController(question_controller, animated: true)
  end

  def setup_an_app
    setup_controller = SetupController.new
    setup_controller.modalTransitionStyle = UIModalTransitionStyleCoverVertical

    self.navigationController.presentModalViewController(setup_controller, animated: true)
  end
end
