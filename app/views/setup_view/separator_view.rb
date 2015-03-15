class SetupView::SeparatorView < UIView
  def initWithFrame frame
    super
    self.frame = [[0, frame.size.height - 1], [frame.size.width, 1]]
    self.autoresizingMask = self.flexible_width

    # color = 929494
    # self.backgroundColor = UIColor.colorWithRed(0.573, green:0.58, blue:0.58, alpha:1) if is_last_row?(current_row)
    # self.styleClass = last_row?(current_row) ? 'colorized_separator' : 'transparent_separator'



    # # Trick to colorize separator in last row; I dont know - he draw last line without my wish!
    # p '>>>>>>>>>>>>>>>>>'
    # p current_row
    # p '>>>>>>>>>>>>>>>>>'

    # self.backgroundColor = if (current_row != (SearchOption.count - 1))
    #   UIColor.colorWithRed(0.573, green:0.58, blue:0.58, alpha:1) #929494
    # else
    #   UIColor.clearColor
    # end

    self
  end

  private
  def last_row? row
    row != (SearchOption.count - 1)
  end
end
