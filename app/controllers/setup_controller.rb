class SetupController < UIViewController
  def loadView
    self.view = SetupView.alloc.initWithFrame(UIScreen.mainScreen.bounds)
  end

  def back_to_main
    main_controller = MainController.new
    main_controller.modalTransitionStyle = UIModalTransitionStyleCoverVertical

    self.dismissModalViewControllerAnimated(true)
  end
end

