class SetupView::SwitchRadioButtonView < UISwitch
  def initWithFrame frame, option
    super
    self.tintColor = UIColor.colorWithRed(0.573, green:0.58, blue:0.58, alpha:1) #929494

    self.on = option.is_set?
    self.addTarget(self, action: 'switch_is_changed:', forControlEvents: UIControlEventValueChanged)
    self
  end

  private
  def switch_is_changed sender
    option = SearchOption.find_by_name(sender.superview.text)
    option.set(sender.on?)
  end
end
