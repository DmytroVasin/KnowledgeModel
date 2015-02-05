class MainViewController < UIViewController
  def loadView
    self.view = MainView.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    self.view.my_controller = self
  end

  def viewDidLoad
  end

  def start_testing
    questionViewController = QuestionViewController.alloc.init
    # questionViewController.delegate = self

    self.presentViewController questionViewController, animated:true, completion:nil
  end

   def done_with_b
    self.dismissViewControllerAnimated true, completion:nil
  end
end
