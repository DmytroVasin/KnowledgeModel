class StartView < UIView
  def initWithFrame(frame)
    super.tap do
      self.styleId = 'question_view'

      addSubview( button_setup )

      addSubview( label_ruby_test )
      addSubview( label_by )
      addSubview( image_j_way )
    end
  end

  def button_setup
    @button_setup ||= UIButton.buttonWithType(UIButtonTypeCustom).tap do |button|
      button.frame = [
        [self.frame.size.width - 110, 0],
        [110, 40]
      ]

      button.styleId = 'button_setup'
      button.setTitle('настройка', forState: UIControlStateNormal)
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
      label.text = 'Ruby Test'
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
    end
  end
end
