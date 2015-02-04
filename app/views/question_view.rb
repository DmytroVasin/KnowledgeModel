class QuestionView < UIView
  def initWithFrame(frame)
    super.tap do
      self.styleId = 'main_view'

      addSubview( label('Ruby Test', 'label_ruby_test') )
      addSubview( label('BY', 'label_by') )
      addSubview( label('', 'label_j_way') )
      # image...
      addSubview( start_button )
    end
  end

  def label text, id
    UILabel.alloc.initWithFrame(CGRectZero).tap do |label|
      label.styleId = id
      label.text = text
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
