class MainView < UIView
  def initWithFrame(frame)
    super.tap do
      self.styleId = 'main_view'

      addSubview( QuestionView.alloc.initWithFrame(
        [
          [20, 30],
          [self.frame.size.width - 40 , self.frame.size.height - 50]
        ]
      ))
    end
  end
end
