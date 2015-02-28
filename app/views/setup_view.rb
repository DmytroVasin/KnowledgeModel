class SetupView < UIView
  attr_accessor  :main_controller

  def initWithFrame frame
    super
    self.styleId = 'main_view'

    zz = SetupView::Setup.alloc.initWithFrame(
      [[20, 30], [self.frame.size.width - 40 , self.frame.size.height - 95]]
    ).tap{|subview|
      subview.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight
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

      button.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin

      button.setTitle('Сохранить', forState: UIControlStateNormal)
      button.styleId = 'start_button'

      button.addTarget(main_controller, action: 'back_action', forControlEvents: UIControlEventTouchUpInside)
    end
  end
end
