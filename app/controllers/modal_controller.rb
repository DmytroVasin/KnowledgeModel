class ModalController < UIViewController
  def back_action
    self.dismissModalViewControllerAnimated(true)
  end
end
