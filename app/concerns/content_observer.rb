module ContentObserver
  def observeValueForKeyPath keyPath, ofObject: object, change: change, context: context
    set_content_size object
  end

  private
  def set_content_size object
    bounds_height  = object.bounds.size.height
    content_height = object.contentSize.height

    if bounds_height >= content_height
      top_correct = ( bounds_height - content_height )/2.0
      bottom_offset = CGPointMake(0, -top_correct);

      object.setContentOffset(bottom_offset, animated: false)
    end
  end
end
