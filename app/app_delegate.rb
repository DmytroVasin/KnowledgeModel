class AppDelegate
  include CDQ

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    cdq.setup

    fill_the_data_base

    window.rootViewController = nav_view_controller
    window.makeKeyAndVisible

    # cdq.save
    # cdq.reset!
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

  def fill_the_data_base
    question = Question.create({
      id: 1,
      question: 'Какое самое крепкое вещество вы принимали?',
      answer: 'Слезу комсомолки. Пьющий просто водку сохраняет и здравый ум, и твёрдую память или, наоборот, теряет разом и то и другое.'
    })

    question = Question.create({
      id: 2,
      question: 'At this point we can simply build and run the app, and CDQ will handle the migration (or rather, CDQ will instruct Core Data.',
      answer: 'So far in our todo app all we can do is store tasks with no bearing even on whether they’ve been completed or not.'
    })
  end
end
