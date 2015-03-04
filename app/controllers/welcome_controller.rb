class WelcomeController < ApplicationController
  def loadView
    self.view = WelcomeView.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight
    self.view.welcome_controller = self

    self.view.when_swiped{ next_question_action }.direction = UISwipeGestureRecognizerDirectionLeft
    self.view.when_swiped{ setup_action }.direction = UISwipeGestureRecognizerDirectionUp
  end
end
