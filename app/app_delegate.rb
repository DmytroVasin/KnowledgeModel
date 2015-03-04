class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    window.rootViewController = nav_view_controller
    window.rootViewController.wantsFullScreenLayout = true
    window.makeKeyAndVisible

    SearchOption.init

    true
  end

  def window
    @window ||= UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
  end

  def welcome_view_controller
    @welcome_view_controller ||= WelcomeController.alloc.initWithNibName(nil, bundle: nil)
  end

  def nav_view_controller
    @nav_view_controller ||= UINavigationController.alloc.initWithRootViewController(welcome_view_controller)
    @nav_view_controller.setNavigationBarHidden(true, animated: false)

    @nav_view_controller
  end
end
