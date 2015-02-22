class AnswerController < ModalController
  attr_accessor :question_id

  def loadView
    self.view = AnswerView.alloc.initWithFrame(UIScreen.mainScreen.bounds, self.question_id)
    self.view.answer_controller = self

    self.view.when_swiped{ back_action }.direction = UISwipeGestureRecognizerDirectionRight
  end
end
