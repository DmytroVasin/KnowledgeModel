class SetupController < UIViewController
  def loadView
    self.view = SetupView.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    self.view.main_controller = self
  end

  def back_to_main
    self.dismissModalViewControllerAnimated(true)
  end
end

