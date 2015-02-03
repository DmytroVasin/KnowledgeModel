class AppDelegate
  include CDQ

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    cdq.setup

    window.rootViewController = main_view_controller
    window.makeKeyAndVisible

    true
  end

  def window
    @window ||= UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
  end

  def main_view_controller
    @main_view_controller ||= QuestionViewController.alloc.initWithNibName(nil, bundle: nil)
  end

  # def navigation_controller
  #   @navigation_controller ||= UINavigationController.alloc.initWithRootViewController(main_view_controller)
  # end
end
