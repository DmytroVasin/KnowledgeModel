class MainView < UIView
  def initWithFrame(frame)
    super.tap do
      self.styleId = 'main_view'

      addSubview( QuestionView.alloc.initWithFrame(
        [
          [20, 30],
          [self.frame.size.width - 40 , self.frame.size.height - 95]
        ]
      ))
      addSubview( start_button )
    end
  end

  def start_button
    @timer_button = UIButton.buttonWithType(UIButtonTypeCustom).tap do |button|
      button.frame = [
        [self.frame.size.width/2 - 100, self.frame.size.height - 55],
        [200, 40]
      ]

      button.setTitle('Начать', forState: UIControlStateNormal)
      button.styleId = 'start_button'

      # button.addTarget(nextResponder, action: 'timer_button_tapped:', forControlEvents: UIControlEventTouchUpInside)
    end
  end
end
