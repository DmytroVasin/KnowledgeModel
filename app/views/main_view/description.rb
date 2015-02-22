class MainView::Description < UIView
  def initWithFrame frame, controller
    super
    self.styleClass = 'main_view_wrapper'

    self.addSubview( button_setup(controller) )
    self.addSubview( label_ruby_test )
    self.addSubview( label_by )
    self.addSubview( image_j_way )
  end

  def button_setup controller
    @button_setup ||= UIButton.buttonWithType(UIButtonTypeCustom).tap do |button|
      button.frame = [
        [self.frame.size.width - 110, 0],
        [110, 40]
      ]

      button.styleId = 'button_setup'
      button.setTitle('настройка', forState: UIControlStateNormal)
      button.addTarget(controller, action: 'setup_action', forControlEvents: UIControlEventTouchUpInside)
    end
  end

  def label_ruby_test
    @label_ruby_test ||= UILabel.alloc.initWithFrame(CGRectZero).tap do |label|
      label.sizeToFit
      label.frame = [
        [self.frame.size.width/2 - 130, self.frame.size.height/2 - 100],
        [260, 60]
      ]

      label.styleId = 'label_ruby_test'
      label.text = 'Руби Тест'
    end
  end

  def label_by
    @label_by ||= UILabel.alloc.initWithFrame(CGRectZero).tap do |label|
      label.sizeToFit
      label.frame = [
        [self.frame.size.width/2 - 130, @label_ruby_test.frame.origin.y + 80],
        [260, 60]
      ]

      label.styleId = 'label_by'
      label.text = 'BY'
    end
  end

  def image_j_way
    img = UIImage.imageNamed('interface/j-way.png')

    @j_way_image_view ||= UIImageView.alloc.initWithImage(img).tap do |image|
      image.styleId = 'label_j_way'
      image.frame = [
        [self.frame.size.width/2 - 125, @label_by.frame.origin.y + 80],
        [265, 75]
      ]
      image.contentMode = UIViewContentModeScaleAspectFit
    end
  end
end
