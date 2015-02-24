class SetupView < UIView
  attr_accessor  :main_controller

  def initWithFrame frame
    super
    self.styleId = 'main_view'

    @zz = SetupView::Setup.alloc.initWithFrame( [ [20, 30], [self.frame.size.width - 40 , self.frame.size.height - 95] ] )
    @zz.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight

    self.addSubview( @zz )


    self.addSubview( back_to_main_button )
  end

  def back_to_main_button
    UIButton.buttonWithType(UIButtonTypeCustom).tap do |button|
      button.frame = [
        [self.frame.size.width/2 - 100, @zz.frame.origin.y + @zz.frame.size.height + 10],
        [200, (self.frame.size.height)-(@zz.frame.origin.y + @zz.frame.size.height + 10) - 10]
      ]

      button.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin

      button.setTitle('Сохранить', forState: UIControlStateNormal)
      button.styleId = 'start_button'

      button.addTarget(main_controller, action: 'back_action', forControlEvents: UIControlEventTouchUpInside)
    end
  end
end
