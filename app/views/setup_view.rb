class SetupView < UIView
  def initWithFrame frame
    super.tap do
      self.styleId = 'main_view'

      self.addSubview( SetupView::Setup.alloc.initWithFrame(
        [
          [20, 30],
          [self.frame.size.width - 40 , self.frame.size.height - 95]
        ]
      ))

      self.addSubview( back_to_main_btn )
    end
  end

  def back_to_main_btn
    UIButton.buttonWithType(UIButtonTypeCustom).tap do |button|
      button.frame = [
        [self.frame.size.width/2 - 100, self.frame.size.height - 55],
        [200, 40]
      ]

      button.setTitle('Сохранить', forState: UIControlStateNormal)
      button.styleId = 'start_button'

      button.addTarget(nil, action: 'back_to_main', forControlEvents: UIControlEventTouchUpInside)
    end
  end
end
