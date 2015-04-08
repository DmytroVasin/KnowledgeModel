class SetupView::TableOptionView < UITableView
  def initWithFrame frame
    super

    @table = UITableView.alloc.initWithFrame(CGRectZero, style: UITableViewStylePlain)
    @table.styleId = 'table_view_wrapper'

    @table.frame = [
      [30, 50],
      [frame.size.width - 60, frame.size.height - 60]
    ]

    @table.autoresizingMask = @table.flexible_width_height

    @table.dataSource = self
    @table.separatorInset = UIEdgeInsetsZero
    @table.layoutMargins = UIEdgeInsetsZero
    @table.separatorStyle = UITableViewCellSeparatorStyleNone
    @table.alwaysBounceVertical = false
    @table.allowsSelection = false

    @table
  end

  def tableView tableView, numberOfRowsInSection: section
    SearchOption.count
  end

  def tableView tableView, cellForRowAtIndexPath: indexPath
    current_option = SearchOption.all[indexPath.row]

    cell = nil

    @reuse_identifier ||= 'MyCells'
    cell = tableView.dequeueReusableCellWithIdentifier(@reuse_identifier) ||
           UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier: @reuse_identifier)

    cell.layoutMargins = UIEdgeInsetsZero
    cell.backgroundColor = UIColor.clearColor

    cell.textLabel.text = current_option.name

    cell.font = UIFont.fontWithName('Verdana', size: 16)

    cell.accessoryView  = SetupView::SwitchRadioButtonView.alloc.initWithFrame(CGRectZero, current_option)
    separator_line_view = SetupView::SeparatorView.alloc.initWithFrame(cell.frame, indexPath.row)
    cell.addSubview(separator_line_view)

    cell
  end
end
