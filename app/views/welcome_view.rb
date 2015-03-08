class WelcomeView < UIView
  attr_accessor  :welcome_controller

  def initWithFrame frame
    super
    self.styleId = 'app_wrapper'

    welcome_view = WelcomeView::Description.alloc.initWithFrame(frame, welcome_controller)
    self.addSubview( welcome_view )
    self.addSubview( start_button )
  end

  def start_button
    JWButton.default_button('Начать',
      action: 'next_question_action',
      frame: self.frame,
      controller: welcome_controller
    )
  end
end
