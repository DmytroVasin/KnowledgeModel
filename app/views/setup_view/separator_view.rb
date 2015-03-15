class SetupView::SeparatorView < UIView
  def initWithFrame frame, current_row
    super
    self.frame = [[0, frame.size.height - 1], [frame.size.width, 1]]
    self.autoresizingMask = self.flexible_width

    # Trick to colorize separator in last row; I dont know - he draw last colored line without my wish!
    self.styleId = last_row?(current_row) ? 'transparent_separator' : 'colorized_separator'
    self
  end

  private
  def last_row? row
    row == (SearchOption.count - 1)
  end
end
