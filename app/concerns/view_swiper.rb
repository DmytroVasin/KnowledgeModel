class UIView
  DIRECTIONS = {
    up:    UISwipeGestureRecognizerDirectionUp,
    down:  UISwipeGestureRecognizerDirectionDown,
    left:  UISwipeGestureRecognizerDirectionLeft,
    right: UISwipeGestureRecognizerDirectionRight
  }

  def swipe direction, &block
    swipe_with_direction(DIRECTIONS[direction], &block)
  end

  private
  def swipe_with_direction direction, &block
    swiper = when_swiped(&block)
    swiper.direction = direction
    swiper
  end
end
