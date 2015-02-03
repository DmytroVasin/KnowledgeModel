class QuestionViewController < UIViewController
  def loadView
    self.view = QuestionView.alloc.initWithFrame(CGRectZero)
  end

  def viewDidLoad
    self.view.backgroundColor = UIColor.whiteColor

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
