class UIView
  def flexible_height
    UIViewAutoresizingFlexibleHeight
  end

  def flexible_width
    UIViewAutoresizingFlexibleWidth
  end

  def flexible_top
    UIViewAutoresizingFlexibleTopMargin
  end

  def flexible_right
    UIViewAutoresizingFlexibleRightMargin
  end

  def flexible_bottom
    UIViewAutoresizingFlexibleBottomMargin
  end

  def flexible_left
    UIViewAutoresizingFlexibleLeftMargin
  end


  def flexible_width_height
    flexible_height | flexible_width
  end

  def flexible_left_right
    flexible_left | flexible_right
  end

  def flexible_top_bottom
    flexible_top | flexible_bottom
  end


  def flexible_all
    flexible_left_right | flexible_top_bottom
  end
end
