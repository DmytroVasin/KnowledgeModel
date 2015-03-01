class AnswerController < ModalController
  attr_accessor :answer

  def loadView
    self.view = AnswerView.alloc.initWithFrame(UIScreen.mainScreen.bounds, self.answer)
    self.view.answer_controller = self

    self.view.when_swiped{ dismiss_view }.direction = UISwipeGestureRecognizerDirectionRight
  end
end
