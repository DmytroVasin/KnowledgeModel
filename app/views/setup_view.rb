class SetupView < UIView
  attr_accessor  :setup_controller

  def initWithFrame frame
    super
    self.styleId = 'app_wrapper'

    setup_view = SetupView::Setup.alloc.initWithFrame(frame)
    self.addSubview( setup_view )
    self.addSubview( back_to_main_button )
  end

  def back_to_main_button
    JWButton.default_button('Сохранить',
      action: 'dismiss_modal',
      frame: self.frame,
      controller: setup_controller
    )
  end
end
