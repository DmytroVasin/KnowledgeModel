class SetupView::SettingsView < UIView
  def initWithFrame frame
    super
    self.styleId = 'interview_wrapper'

    self.frame = [[20, 30], [frame.size.width - 40, frame.size.height - 95]]
    self.autoresizingMask = self.flexible_width_height

    self.addSubview( table_view )
    self.addSubview( table_title )
  end

  def table_view
    @table_view ||= SetupView::TableOptionView.alloc.initWithFrame(self.frame)
  end

  def table_title
    @table_title ||= UILabel.alloc.initWithFrame(CGRectZero).tap do |label|
      label.frame = [[self.frame.size.width/2 - 100, 10], [200, 40]]
      label.autoresizingMask = label.flexible_left_right

      label.styleClass = 'label'
      label.styleId = 'label_table_title'
      label.text = 'Выберите темы:'
    end
  end
end
