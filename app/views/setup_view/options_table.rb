class SetupView::OptionsTable < UIView
  def initWithFrame frame
    super.tap do
      self.styleClass = 'table_view_wrapper'

      self.addSubview( init_table_view )
    end
  end

  def init_table_view
    @myTableView ||= UITableView.alloc.initWithFrame(bounds, style: UITableViewStylePlain)
    @myTableView.dataSource = self

    # @myTableView.scrollEnabled = (@myTableView.contentSize.height < @myTableView.frame.size.height)
    @myTableView.alwaysBounceVertical = false

    # @myTableView.delegate = self
    # @myTableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight
    @myTableView
  end

  def numberOfSectionsInTableView tableView
    1
  end

  def tableView tableView, numberOfRowsInSection: section
    SearchOptions.options.count
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    result = nil

    if tableView == @myTableView
      tableViewCellIdentifier = "MyCells"

      result = tableView.dequeueReusableCellWithIdentifier(tableViewCellIdentifier)

      if result == nil
        result = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:tableViewCellIdentifier)
      end

      result.textLabel.text = SearchOptions.options_array[indexPath.row]

      result.accessoryView = switch_radio_btn
    end
    result
  end

  def switch_radio_btn
    @switch = UISwitch.alloc.initWithFrame([ [0, 0], [0, 0] ]).tap {|switch|
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
