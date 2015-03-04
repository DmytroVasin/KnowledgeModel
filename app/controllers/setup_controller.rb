class SetupController < ModalController
  def loadView
    self.view = SetupView.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    self.view.setup_controller = self

    self.view.swipe(:down){ dismiss_view }
  end
end

