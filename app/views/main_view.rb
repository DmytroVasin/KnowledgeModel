class MainView < UIView
  attr_accessor :my_controller

  def initWithFrame(frame)
    super.tap do
      self.styleId = 'main_view'

      addSubview( StartView.alloc.initWithFrame(
        [
          [20, 30],
          [self.frame.size.width - 40 , self.frame.size.height - 95]
        ]
      ))

      self.addSubview( start_button )
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

      button.addTarget(my_controller, action: 'start_testing', forControlEvents: UIControlEventTouchUpInside)
    end
  end
end
