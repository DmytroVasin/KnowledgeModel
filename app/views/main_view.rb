class MainView < UIView
  attr_accessor  :main_controller

  def initWithFrame frame
    super
    self.styleId = 'main_view'


    @z = MainView::Description.alloc.initWithFrame( [ [20, 30], [self.frame.size.width - 40 , self.frame.size.height - 95] ], main_controller )
    @z.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight

    self.addSubview( @z )

    self.addSubview( start_button )
  end

  def start_button
    UIButton.buttonWithType(UIButtonTypeCustom).tap do |button|
      button.frame = [
        [self.frame.size.width/2 - 100, @z.frame.origin.y + @z.frame.size.height + 10],
        [200, (self.frame.size.height)-(@z.frame.origin.y + @z.frame.size.height + 10) - 10]
      ]

      button.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth

      button.setTitle('Начать', forState: UIControlStateNormal)
      button.styleId = 'start_button'

      button.addTarget(main_controller, action: 'next_question_action', forControlEvents: UIControlEventTouchUpInside)
    end
  end
end
