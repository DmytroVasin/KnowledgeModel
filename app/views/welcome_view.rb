class WelcomeView < UIView
  attr_accessor  :welcome_controller

  def initWithFrame frame
    super
    self.styleId = 'welcome_view'

    welcome_view = WelcomeView::Description.alloc.initWithFrame(frame, welcome_controller)
    self.addSubview( welcome_view )
    self.addSubview( start_button )
  end

  def start_button
    UIButton.buttonWithType(UIButtonTypeCustom).tap do |button|
      button.frame = [
        [self.frame.size.width/2 - 167, self.frame.size.height - 53],
        [334, 41]
      ]

      button.setTitle('Начать', forState: UIControlStateNormal)
      button.styleClass = 'btn'

      button.autoresizingMask = button.flexible_left_right | button.flexible_top
      button.addTarget(welcome_controller, action: 'next_question_action', forControlEvents: UIControlEventTouchUpInside)
    end
  end
end
