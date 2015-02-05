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
    @main_view_controller ||= MainViewController.alloc.initWithNibName(nil, bundle: nil)
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
