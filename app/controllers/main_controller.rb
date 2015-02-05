class MainViewController < UIViewController
  def loadView
    self.view = MainView.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    self.view.addSubview( start_button )
  end

  def start_button
    UIButton.buttonWithType(UIButtonTypeCustom).tap do |button|
      button.frame = [
        [self.view.frame.size.width/2 - 100, self.view.frame.size.height - 55],
        [200, 40]
      ]

      button.setTitle('Начать', forState: UIControlStateNormal)
      button.styleId = 'start_button'

      button.addTarget(self, action: 'start_testing', forControlEvents: UIControlEventTouchUpInside)
    end
  end


  def viewDidLoad
  end

  def start_testing
    puts '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
    questionViewController = QuestionViewController.alloc.init
    questionViewController.delegate = self

    self.presentViewController questionViewController, animated:true, completion:nil
  end

  def done_with_b
    self.view = MainView.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    self.view.addSubview( start_button )
  end
end
