class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    window.rootViewController = nav_view_controller
    window.makeKeyAndVisible

    SearchOption.init

    true
  end

  def window
    @window ||= UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
  end

  def main_view_controller
    @main_view_controller ||= MainController.alloc.initWithNibName(nil, bundle: nil)
  end

  def nav_view_controller
    @nav_view_controller ||= UINavigationController.alloc.initWithRootViewController(main_view_controller)
    @nav_view_controller.setNavigationBarHidden(true, animated:false)

    @nav_view_controller
  end

  # def start_test
  #   @alert = UIAlertView.alloc.initWithTitle('Greeting',
  #       message:'Hi again!',
  #       delegate: nil,
  #       cancelButtonTitle: 'ok',
  #       otherButtonTitles:nil)
  #   @alert.show
  # UIApplication.sharedApplication.window[0].rootViewController.viewControllers[1].topViewController...
  # end
end
