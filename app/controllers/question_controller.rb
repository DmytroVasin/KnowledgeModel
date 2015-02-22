class QuestionController < ApplicationController
  def loadView
    self.view = QuestionView.alloc.initWithFrame(UIScreen.mainScreen.bounds, load_random_question)
    self.view.question_controller = self

    self.view.when_swiped{ next_question_action }.direction = UISwipeGestureRecognizerDirectionLeft
    self.view.when_swiped{ setup_action }.direction = UISwipeGestureRecognizerDirectionUp
    self.view.when_swiped{ get_answer }.direction = UISwipeGestureRecognizerDirectionRight
  end

  def get_answer
    answer_controller = AnswerController.new.tap {|controller|
      controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal
      controller.question_id = @question.id
    }

    show_modal(answer_controller)
  end

  private
  def load_random_question
    @question = Question.load_by_options
  end
end
