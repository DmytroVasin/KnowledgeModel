class MainView < UIView
  attr_accessor  :main_controller

  def initWithFrame frame
    super.tap do
      self.styleId = 'main_view'

      addSubview( MainView::Description.alloc.initWithFrame(
        [
          [20, 30],
          [self.frame.size.width - 40 , self.frame.size.height - 95]
        ],
        main_controller
      ))

      addSubview( start_button )

      swipe = when_swiped{ main_controller.setup_an_app }
      swipe.direction = UISwipeGestureRecognizerDirectionUp
    end
  end

  def start_button
    UIButton.buttonWithType(UIButtonTypeCustom).tap do |button|
      button.frame = [
        [self.frame.size.width/2 - 100, self.frame.size.height - 55],
        [200, 40]
      ]

      button.setTitle('Начать', forState: UIControlStateNormal)
      button.styleId = 'start_button'

      button.addTarget(main_controller, action: 'start_testing', forControlEvents: UIControlEventTouchUpInside)
    end
  end
end
