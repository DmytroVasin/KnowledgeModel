class MainController < ApplicationController
  def loadView
    # TODO: Add some before action/filter?
    self.view = MainView.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    self.view.main_controller = self

    self.view.when_swiped{ next_question_action }.direction = UISwipeGestureRecognizerDirectionLeft
    self.view.when_swiped{ setup_action }.direction = UISwipeGestureRecognizerDirectionUp
  end
end
