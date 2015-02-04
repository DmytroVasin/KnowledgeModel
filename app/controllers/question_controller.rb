class QuestionViewController < UIViewController
  def loadView
    # self.view = QuestionView.alloc.initWithFrame(CGRectZero)
    self.view = MainView.alloc.initWithFrame(UIScreen.mainScreen.bounds)
  end

  def viewDidLoad
    # @label = UILabel.alloc.initWithFrame(CGRectZero)
    # @label.text = "Colors"
    # @label.sizeToFit
    # @label.center = [self.view.frame.size.width / 2, self.view.frame.size.height / 2]
    # @label.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin

    # self.view.addSubview(@label)




    # view.image = UIImage.imageNamed('background.png')

    # @start_button = prepare_start_button
    # view.addSubview( @start_button )
    # @start_button.addTarget( self, action: 'start_test',
    #                                forControlEvents: UIControlEventTouchUpInside )


  end


  # def prepare_start_button
  #   UIButton.buttonWithType(UIButtonTypeRoundedRect).tap do |button|
  #     button.styleId = 'timer_button'
  #     button.setTitle('Start', forState: UIControlStateNormal)
  #     button.sizeToFit

  #     button.frame = [
  #       [10, 30], [50, 50]
  #     ]
  #   end
  # end

  # def start_test
  #   alert = UIAlertView.new
  #   alert.message = 'Hello World'
  #   alert.title = 'Hello World'

  #   alert.show
  # end
end
