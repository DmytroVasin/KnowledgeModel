class ModalController < UIViewController
  def dismiss_view
    self.dismissViewControllerAnimated(true, completion: nil)
  end
end
