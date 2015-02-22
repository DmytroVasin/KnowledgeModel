class SetupView::OptionsTable < UIView
  def initWithFrame frame
    super

    self.addSubview( init_table_view )
  end

  def init_table_view
    # TODO: Refactoring.
    @myTableView ||= UITableView.alloc.initWithFrame(bounds, style: UITableViewStylePlain)
    @myTableView.dataSource = self

    @myTableView.frame = CGRectMake(
      30, 50,
      @myTableView.frame.size.width - 60, 55 * (SearchOptions.options.count - 1) - 1
    )

    @myTableView.separatorInset = UIEdgeInsetsZero;
    @myTableView.layoutMargins = UIEdgeInsetsZero;

    @myTableView.styleClass = 'table_view_wrapper'

    # @myTableView.scrollEnabled = (@myTableView.contentSize.height < @myTableView.frame.size.height)
    @myTableView.alwaysBounceVertical = false
    @myTableView.allowsSelection = false
    @myTableView.separatorColor = UIColor.colorWithRed(217/255, green: 218/255, blue: 219/255, alpha: 1) # color = #d9dadb
    # @myTableView.separatorStyle = UITableViewCellSeparatorStyleNone

    # @myTableView.delegate = self
    # @myTableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight
    @myTableView
  end

  def tableView tableView, numberOfRowsInSection: section
    SearchOptions.options.count
  end

  def tableView tableView, cellForRowAtIndexPath: indexPath
    result = nil #result == cell ?

    if tableView == @myTableView
      tableViewCellIdentifier = "MyCells"

      result = tableView.dequeueReusableCellWithIdentifier(tableViewCellIdentifier)

      if result == nil
        result = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier: tableViewCellIdentifier)
      end

      result.layoutMargins = UIEdgeInsetsZero
      result.backgroundColor = UIColor.clearColor
      result.textLabel.text = SearchOptions.options_array[indexPath.row]
      result.accessoryView = switch_radio_btn

      if indexPath.row == SearchOptions.options.count - 1
        separatorLineView = UIView.alloc.initWithFrame([[0, result.frame.size.height-1], [result.frame.size.width, 1]])
        separatorLineView.styleClass = 'separatorLineViewClass'
        result.contentView.addSubview(separatorLineView)
      end

    end
    result
  end

  def switch_radio_btn
    @switch = UISwitch.alloc.initWithFrame([ [0, 0], [0, 0] ]).tap {|switch|
      switch.tintColor = UIColor.grayColor

      switch.on = true
      switch.addTarget(nil, action: 'switch_is_changed:', forControlEvents: UIControlEventValueChanged)
    }
  end

  def switch_is_changed sender
    ownerCell = sender.superview

    unless (ownerCell == nil)
      ownerCellIndexPath = @myTableView.indexPathForCell(ownerCell)

      SearchOptions.change_status_for(ownerCellIndexPath.row, sender.on?)
    end
  end
end
