class WelcomeView::Description < UIView
  def initWithFrame frame, controller
    super
    self.styleClass = 'main_view_wrapper'
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
      button.setTitle('настройка', forState: UIControlStateNormal)
      button.addTarget(controller, action: 'setup_action', forControlEvents: UIControlEventTouchUpInside)
    end
  end

  def label_ruby_test
    @label_ruby_test ||= UILabel.alloc.initWithFrame(CGRectZero).tap do |label|
      label.sizeToFit
      label.frame = label_bounds(self.frame)
      label.autoresizingMask = label.flexible_all

      label.styleId = 'label_ruby_test'
      label.text = 'Руби Тест'
    end
  end

  def label_by
    @label_by ||= UILabel.alloc.initWithFrame(CGRectZero).tap do |label|
      label.sizeToFit
      label.frame = label_bounds(@label_ruby_test.frame)

      label.autoresizingMask = label.flexible_all

      label.styleId = 'label_by'
      label.text = 'BY'
    end
  end

  def image_j_way
    img = UIImage.imageNamed('interface/j-way.png')

    UIImageView.alloc.initWithImage(img).tap do |image|
      image.styleId = 'label_j_way'
      image.frame = label_bounds(@label_by.frame)

      image.autoresizingMask = image.flexible_all
      image.contentMode = UIViewContentModeScaleAspectFill
    end
  end

  private
  def label_bounds previous_frame
    [
      [self.frame.size.width/2 - 130, previous_frame.origin.y + 140],
      [260, 60]
    ]
  end
end
