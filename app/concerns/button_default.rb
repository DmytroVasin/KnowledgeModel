class JWButton
  def self.default_button(title, action: action, frame: frame, controller: controller)
    UIButton.buttonWithType(UIButtonTypeCustom).tap do |button|
      button.frame = [
        [20, frame.size.height - 53],
        [frame.size.width - 40, 41]
      ]

      button.setTitle(title, forState: UIControlStateNormal)
      button.styleClass = 'btn'

      button.autoresizingMask = button.flexible_left_right | button.flexible_top
      button.addTarget(controller, action: action, forControlEvents: UIControlEventTouchUpInside)
    end
  end
end
