class AnswerController < ModalController
  attr_accessor :answer

  def loadView
    self.view = AnswerView.alloc.initWithFrame(UIScreen.mainScreen.bounds, self.answer)
    self.view.answer_controller = self

    self.view.swipe(:right){ dismiss_view }
  end
end
