class SetupView::Setup < UIView
  def initWithFrame frame
    super
    self.styleClass = 'main_view_wrapper'

    self.addSubview( table_view )
    self.addSubview( table_title )
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

      label.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin

      label.styleId = 'label_table_title'
      label.text = 'Выберите темы:'
    end
  end

  def table_view
    # TODO: Refactoring.
    @myTableView ||= UITableView.alloc.initWithFrame(CGRectZero, style: UITableViewStylePlain)

    @myTableView.frame = [
      [30, 50],
      [self.frame.size.width - 60, self.frame.size.height - 60]
    ]

    @myTableView.dataSource = self

    @myTableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight

    @myTableView.separatorInset = UIEdgeInsetsZero;
    @myTableView.layoutMargins = UIEdgeInsetsZero;

    @myTableView.styleClass = 'table_view_wrapper'

    @myTableView.alwaysBounceVertical = false
    @myTableView.allowsSelection = false
    @myTableView.separatorStyle = UITableViewCellSeparatorStyleNone

    # @myTableView.delegate = self
    @myTableView
  end

  def tableView tableView, numberOfRowsInSection: section
    SearchOption.count
  end

  def tableView tableView, cellForRowAtIndexPath: indexPath
    current_option = SearchOption.all[indexPath.row]

    result = nil #result == cell ?

    if tableView == @myTableView
      tableViewCellIdentifier = "MyCells"

      result = tableView.dequeueReusableCellWithIdentifier(tableViewCellIdentifier)

      if result == nil
        result = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier: tableViewCellIdentifier)
      end

      result.layoutMargins = UIEdgeInsetsZero

      result.backgroundColor = UIColor.clearColor

      result.textLabel.text = current_option.name
      result.accessoryView = switch_radio_btn(current_option)


      separatorLineView = UIView.alloc.initWithFrame([[0, result.frame.size.height - 1], [result.frame.size.width, 1]])
      # Trick to colorize separator in last row; I dont know - how he drow it without my wish!
      separatorLineView.backgroundColor = if (indexPath.row != (SearchOption.count - 1))
        UIColor.colorWithRed(0.573, green:0.58, blue:0.58, alpha:1) #929494
      else
        UIColor.colorWithRed(0.851, green:0.855, blue:0.859, alpha:1) #d9dadb
      end

      separatorLineView.autoresizingMask = UIViewAutoresizingFlexibleWidth
      result.addSubview(separatorLineView)
    end
    result
  end

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
