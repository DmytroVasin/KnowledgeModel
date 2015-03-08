class SetupView < UIView
  attr_accessor  :setup_controller

  def initWithFrame frame
    super
    self.styleId = 'welcome_view'

    zz = SetupView::Setup.alloc.initWithFrame(
      [[20, 30], [self.frame.size.width - 40 , self.frame.size.height - 95]]
    ).tap{|subview|
      subview.autoresizingMask = subview.flexible_width_height
    }

    self.addSubview( zz )


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
      button.styleId = 'start_button'

      button.addTarget(setup_controller, action: 'dismiss_modal', forControlEvents: UIControlEventTouchUpInside)
    end
  end
end
