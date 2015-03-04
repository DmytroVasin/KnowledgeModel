class WelcomeView < UIView
  attr_accessor  :welcome_controller

  def initWithFrame frame
    super
    self.styleId = 'welcome_view'

    z = WelcomeView::Description.alloc.initWithFrame(
      [[20, 30], [self.frame.size.width - 40 , self.frame.size.height - 95]],
      welcome_controller
    ).tap {|descr_view|
      descr_view.autoresizingMask = descr_view.flexible_width_height
    }

    self.addSubview( z )

    self.addSubview( start_button )
  end

  def start_button
    UIButton.buttonWithType(UIButtonTypeCustom).tap do |button|
      button.frame = [
        [self.frame.size.width/2 - 100, self.frame.size.height - 53],
        [200, 41]
      ]

      button.autoresizingMask = button.flexible_left_right | button.flexible_top | button.flexible_width

      button.setTitle('Начать', forState: UIControlStateNormal)
      button.styleId = 'start_button'

      button.addTarget(welcome_controller, action: 'next_question_action', forControlEvents: UIControlEventTouchUpInside)
    end
  end
end
