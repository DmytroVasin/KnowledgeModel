class QuestionView < UIView
  def initWithFrame(frame)
    super.tap do
      self.styleId = 'question_view'

      addSubview( label_ruby_test )
      addSubview( label_by )
      addSubview( image_j_way )
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
      # image.sizeToFit
      # image.center = CGPointMake(self.frame.size.width/2 + 5, self.frame.size.height/2 + 80)
      image.frame = [
        [self.frame.size.width/2 - 125, @label_by.frame.origin.y + 80],
        [265, 75]
      ]
    end
  end

  def start_button
    @timer_button = UIButton.buttonWithType(UIButtonTypeCustom).tap do |button|
      button.setTitle('Начать', forState: UIControlStateNormal)
      button.styleId = 'start_button'

      button.addTarget(nextResponder, action: 'timer_button_tapped:', forControlEvents: UIControlEventTouchUpInside)
    end
  end
end
