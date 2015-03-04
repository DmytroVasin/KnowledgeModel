class WelcomeController < ApplicationController
  def loadView
    self.view = WelcomeView.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight
    self.view.welcome_controller = self

    self.view.swipe(:left){ next_question_action }
    self.view.swipe(:up){ setup_action }
  end
end
