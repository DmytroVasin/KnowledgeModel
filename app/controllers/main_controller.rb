class MainController < ApplicationController
  def loadView
    self.view = MainView.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    self.view.main_controller = self
  end

  def viewDidLoad
  end

  def start_testing
    question_controller = QuestionController.new
    self.navigationController.pushViewController(question_controller, animated: true)
  end
end
