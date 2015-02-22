class SetupView < UIView
  attr_accessor  :main_controller

  def initWithFrame frame
    super
    self.styleId = 'main_view'

    self.addSubview( SetupView::Setup.alloc.initWithFrame(
      [
        [20, 30],
        [self.frame.size.width - 40 , self.frame.size.height - 95]
      ]
    ))
    self.addSubview( back_to_main_btn )
  end

  def back_to_main_btn
    UIButton.buttonWithType(UIButtonTypeCustom).tap do |button|
      button.frame = [
        [self.frame.size.width/2 - 100, self.frame.size.height - 55],
        [200, 40]
      ]

      button.setTitle('Сохранить', forState: UIControlStateNormal)
      button.styleId = 'start_button'

      button.addTarget(main_controller, action: 'back_action', forControlEvents: UIControlEventTouchUpInside)
    end
  end
end
