class SetupView::Setup < UIView
  def initWithFrame frame
    super.tap do
      self.styleClass = 'main_view_wrapper'

      self.addSubview( SetupView::OptionsTable.alloc.initWithFrame(
        [
          [20, 30],
          [self.frame.size.width - 40 , self.frame.size.height - 95]
        ]
      ))

      self.addSubview( table_title )
    end
  end

  def table_title
    @table_title ||= UILabel.alloc.initWithFrame(CGRectZero).tap do |label|
      label.lineBreakMode = UILineBreakModeWordWrap
      label.numberOfLines = 0
      label.sizeToFit

      label.frame = [
        [60, 20],
        [200, 60]
      ]

      label.styleId = 'label_table_title'
      label.text = 'Выберите темы:'

      # label.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin
    end
  end
end
