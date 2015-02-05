class QuestionView < UIView
  def initWithFrame(frame)
    super.tap do
      self.styleId = 'question_view'
    end
  end
end
