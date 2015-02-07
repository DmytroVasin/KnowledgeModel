class MainViewController < UIViewController
  def loadView
    self.view = MainView.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    self.view.my_controller = self
  end

  def viewDidLoad
    # super
  end

  def start_testing
    questionViewController = QuestionViewController.alloc.init
    self.navigationController.pushViewController(questionViewController, animated:true)
  end
end
