class AnswerController < InterviewController
  attr_accessor :answer

  def loadView
    self.view = AnswerView.alloc.initWithFrame(UIScreen.mainScreen.bounds, interview_view(self.answer))
    self.view.answer_controller = self

    self.view.swipe(:right){ dismiss_modal }
  end
end
