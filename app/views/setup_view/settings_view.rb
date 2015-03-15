class SetupView::SettingsView < UIView
  def initWithFrame frame
    super
    self.styleId = 'interview_wrapper'

    self.frame = [[20, 30], [frame.size.width - 40, frame.size.height - 95]]
    self.autoresizingMask = self.flexible_width_height

    self.addSubview( table_view )
    self.addSubview( table_title )
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

  def table_view
    @my_table_view ||= UITableView.alloc.initWithFrame(CGRectZero, style: UITableViewStylePlain).tap do |my_table_view|
      my_table_view.styleId = 'table_view_wrapper'

      my_table_view.frame = [
        [30, 50],
        [self.frame.size.width - 60, self.frame.size.height - 60]
      ]

      my_table_view.autoresizingMask = my_table_view.flexible_width_height

      my_table_view.dataSource = self
      my_table_view.separatorInset = UIEdgeInsetsZero
      my_table_view.layoutMargins = UIEdgeInsetsZero
      my_table_view.separatorStyle = UITableViewCellSeparatorStyleNone
      my_table_view.alwaysBounceVertical = false
      my_table_view.allowsSelection = false
    end
  end

  def tableView tableView, numberOfRowsInSection: section
    SearchOption.count
  end

  def tableView tableView, cellForRowAtIndexPath: indexPath
    current_option = SearchOption.all[indexPath.row]

    cell = nil

    if tableView == @my_table_view
      tableViewCellIdentifier = "MyCells"

      cell = tableView.dequeueReusableCellWithIdentifier(tableViewCellIdentifier)

      if cell == nil
        cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier: tableViewCellIdentifier)
      end

      cell.layoutMargins = UIEdgeInsetsZero
      cell.backgroundColor = UIColor.clearColor

      cell.textLabel.text = current_option.name
      cell.accessoryView = switch_radio_btn(current_option)

      separator_line_view = SetupView::SeparatorView.alloc.initWithFrame(cell.frame)

      # Trick to colorize separator in last row; I dont know - he draw last line without my wish!
      separator_line_view.backgroundColor = if (indexPath.row != (SearchOption.count - 1))
        UIColor.colorWithRed(0.573, green:0.58, blue:0.58, alpha:1) #929494
      else
        UIColor.clearColor
      end


      cell.addSubview(separator_line_view)
    end
    cell
  end

  private
  def switch_radio_btn option
    UISwitch.alloc.initWithFrame(CGRectZero).tap {|switch|
      switch.tintColor = UIColor.colorWithRed(0.573, green:0.58, blue:0.58, alpha:1) #929494

      switch.on = option.is_set?
      switch.addTarget(self, action: 'switch_is_changed:', forControlEvents: UIControlEventValueChanged)
    }
  end

  def switch_is_changed sender
    option = SearchOption.find_by_name(sender.superview.text)
    option.set(sender.on?)
  end
end
