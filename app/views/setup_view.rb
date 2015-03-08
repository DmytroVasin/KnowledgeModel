class SetupView < UIView
  attr_accessor  :setup_controller

  def initWithFrame frame
    super
    self.styleId = 'welcome_view'

    setup_view = SetupView::Setup.alloc.initWithFrame(frame)
    self.addSubview( setup_view )
    self.addSubview( back_to_main_button )
  end

  def back_to_main_button
    UIButton.buttonWithType(UIButtonTypeCustom).tap do |button|
      button.frame = [
        [self.frame.size.width/2 - 100, self.frame.size.height - 53],
        [200, 41]
      ]

      button.autoresizingMask = button.flexible_left_right | button.flexible_top

      button.setTitle('Сохранить', forState: UIControlStateNormal)
      button.styleClass = 'btn'

      button.addTarget(setup_controller, action: 'dismiss_modal', forControlEvents: UIControlEventTouchUpInside)
    end
  end
end
