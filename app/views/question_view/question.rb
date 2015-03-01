class Question::Wrapper < UIView
  def initWithFrame frame, question
    super
    self.styleClass = 'main_view_wrapper'

    puts '>>>>>>>>>>>>>>>>>>>>>>>>'

    self.addSubview( text_question(question) )
  end

  def text_question question
    @text_question ||= UITextView.alloc.initWithFrame(CGRectZero).tap do |scroll_view|
      scroll_view.styleId = 'label_question'

      scroll_view.text = 'Neither'

      scroll_view.frame = [
        [20, 20],
        [self.frame.size.width - 40, self.frame.size.height - 40]
      ]

      scroll_view.alwaysBounceVertical = false

      scroll_view.editable = false
      scroll_view.selectable = false

      scroll_view.addObserver(self, forKeyPath: 'contentSize', options: NSKeyValueObservingOptionNew, context: nil)

      scroll_view.textAlignment = UITextAlignmentCenter
      scroll_view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight

      puts '>>>>>>>>>>>>>>'
      puts scroll_view.bounds.size.height
      puts scroll_view.contentSize.height
      puts '>>>>>>>>>>>>>>'
    end
  end

  def observeValueForKeyPath keyPath, ofObject: object, change: change, context: context
    tv = object


      puts '>>>>>>>>>>>>>>'
      puts tv.bounds.size.height
      puts tv.contentSize.height
      puts '>>>>>>>>>>>>>>'

    topCorrect = (tv.bounds.size.height - tv.contentSize.height)/2.0
    topCorrect = ( topCorrect < 0 ? 0 : topCorrect )

    bottomOffset = CGPointMake(0, -topCorrect);

    if tv.contentSize.height < tv.bounds.size.height
      tv.setContentOffset(bottomOffset, animated: false);
    end
  end
end
