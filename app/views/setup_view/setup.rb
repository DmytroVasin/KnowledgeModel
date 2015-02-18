class SetupView::Setup < UIView
  def initWithFrame frame
    super.tap do
      self.styleClass = 'main_view_wrapper'

      self.addSubview( SetupView::OptionsTable.alloc.initWithFrame(
        [
          [20, 50],
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
        [self.frame.size.width/2 - 100, 10],
        [200, 40]
      ]

      label.styleId = 'label_table_title'
      label.text = 'Выберите темы:'

      # label.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin
    end
  end
end
