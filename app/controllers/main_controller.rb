class MainViewController < UIViewController
  def loadView
    self.view = MainView.alloc.initWithFrame(UIScreen.mainScreen.bounds)
  end

  def start_test
    questionViewController = QuestionViewController.alloc.init
    questionViewController.delegate = self

    self.presentViewController questionViewController, animated:true, completion:nil
  end
end
