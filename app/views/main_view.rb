class MainView < UIView
  def initWithFrame(frame)
    super.tap do
      self.styleId = 'main_view'

      addSubview( MainView::Description.alloc.initWithFrame(
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

      button.addTarget(nil, action: 'start_testing', forControlEvents: UIControlEventTouchUpInside)
    end
  end
end
