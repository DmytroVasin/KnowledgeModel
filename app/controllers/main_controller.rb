class MainViewController < UIViewController
  attr_accessor :delegate

  def loadView
    self.title = 'Alphabet'

    delegate.setNavigationBarHidden(true, animated:false)

    self.view = MainView.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    self.view.my_controller = self
  end

  def viewDidLoad
    # super
  end

  def start_testing
    questionViewController = QuestionViewController.alloc.init
    # questionViewController.delegate = self

    questionViewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal

    self.presentViewController questionViewController, animated:true, completion:nil
  end

   def done_with_b
    self.dismissViewControllerAnimated true, completion:nil
  end
end
