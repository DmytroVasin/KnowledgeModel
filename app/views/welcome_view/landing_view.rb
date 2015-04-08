class WelcomeView::LandingView < UIView
  def initWithFrame frame, controller
    super
    self.styleId = 'interview_wrapper'
    self.frame = [[20, 30], [frame.size.width - 40, frame.size.height - 95]]
    self.autoresizingMask = self.flexible_width_height

    self.addSubview( button_setup(controller) )
    self.addSubview( label_ruby_test )
    self.addSubview( label_by )
    self.addSubview( image_j_way )
  end

  def button_setup controller
    UIButton.buttonWithType(UIButtonTypeCustom).tap do |button|
      button.frame = [
        [self.frame.size.width - 110, 0],
        [110, 40]
      ]
      button.autoresizingMask = button.flexible_left_right

      button.styleId = 'button_setup'
      button.styleClass = 'label'
      button.setTitle('настройка', forState: UIControlStateNormal)
      button.addTarget(controller, action: 'setup_action', forControlEvents: UIControlEventTouchUpInside)
    end
  end

  def label_ruby_test
    @label_ruby_test ||= UILabel.alloc.initWithFrame(CGRectZero).tap do |label|
      label.sizeToFit
      label.frame = [[10, self.frame.size.height/5],[self.frame.size.width - 20, 60]]
      label.autoresizingMask = label.flexible_all

      label.styleId = 'label_ruby_test'
      label.styleClass = 'label'
      label.text = 'Ruby / Rails'
    end
  end

  def label_by
    @label_by ||= UILabel.alloc.initWithFrame(CGRectZero).tap do |label|
      label.sizeToFit
      label.frame = label_bounds(@label_ruby_test.frame)

      label.autoresizingMask = label.flexible_all

      label.styleId = 'label_by'
      label.styleClass = 'label'
      label.text = 'ТЕСТЫ'
    end
  end

  def image_j_way
    img = UIImage.imageNamed('interface/j-way.png')

    UIImageView.alloc.initWithImage(img).tap do |image|
      image.frame = label_bounds(@label_by.frame)

      image.autoresizingMask = image.flexible_all
      image.contentMode = UIViewContentModeScaleAspectFill
    end
  end

  private
  def label_bounds previous_frame
    [
      [10, previous_frame.origin.y + self.frame.size.height/4],
      [self.frame.size.width - 20, 60]
    ]
  end
end
