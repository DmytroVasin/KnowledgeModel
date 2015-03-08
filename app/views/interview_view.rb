class InterviewView < UIView
  def initWithFrame frame, test_view
    super

    self.frame = [[20, 30],[frame.size.width - 40, frame.size.height - 95]]
    self.styleId = 'interview_wrapper'
    self.autoresizingMask = self.flexible_width_height

    self.addSubview(test_view)
    self
  end
end
