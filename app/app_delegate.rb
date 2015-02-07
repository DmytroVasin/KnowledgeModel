class AppDelegate
  include CDQ

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    cdq.setup

    window.rootViewController = nav_view_controller
    window.makeKeyAndVisible

    true
  end

  def window
    @window ||= UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
  end

  def main_view_controller
    @main_view_controller ||= MainViewController.alloc.initWithNibName(nil, bundle: nil)
  end

  def nav_view_controller
    @nav_view_controller ||= UINavigationController.alloc.initWithRootViewController(main_view_controller)
    @nav_view_controller.setNavigationBarHidden(true, animated:false)
    # @main_view_controller.delegate = @nav_view_controller

    @nav_view_controller
  end

  # def start_test
  #   @alert = UIAlertView.alloc.initWithTitle('Greeting',
  #       message:'Hi again!',
  #       delegate: nil,
  #       cancelButtonTitle: 'ok',
  #       otherButtonTitles:nil)

  #   @alert.show
  # end
end
