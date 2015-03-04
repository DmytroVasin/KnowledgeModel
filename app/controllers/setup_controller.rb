class SetupController < ModalController
  def loadView
    self.view = SetupView.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    self.view.setup_controller = self

    self.view.when_swiped{ dismiss_view }.direction = UISwipeGestureRecognizerDirectionDown
  end
end

