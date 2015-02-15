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
    # @myTableView.delegate = self
    # @myTableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight
    @myTableView
  end

  def numberOfSectionsInTableView(tableView)
    1
  end

  def tableView(tableView, numberOfRowsInSection: section)
    # @arrayOfRows.length
    8
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    result = nil

    if(tableView == @myTableView)
      tableViewCellIdentifier = "MyCells"

      # TODO: WTF?
      result = tableView.dequeueReusableCellWithIdentifier(tableViewCellIdentifier)
      # TODO: WTF?
      if(result == nil)
        result = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:tableViewCellIdentifier)
      end
      # TODO: wht is result?
      result.textLabel.text = "Section: #{indexPath.section}, Cell: #{indexPath.row}"
      result.accessoryView = switch_radio_btn
    end
    result
  end

  def switch_radio_btn
    UISwitch.alloc.initWithFrame([ [0, 0], [0, 0] ]).tap {|switch|
      switch.addTarget(nil, action: 'switch_is_changed:', forControlEvents: UIControlEventValueChanged)
    }
  end

  def switch_is_changed sender
    ownerCell = sender.superview

    unless (ownerCell == nil)
      # index path of the cll which contains the section and row of the cell
      ownerCellIndexPath = @myTableView.indexPathForCell(ownerCell)

      puts '>>>>>>>>>>>>>>>>>>>'
      puts ownerCellIndexPath.section
      puts ownerCellIndexPath.row
      puts '>>>>>>>>>>>>>>>>>>>'

      #p "section = #{ownerCellIndexPath.section} and row = #{ownerCellIndexPath.row}"

      #if (ownerCellIndexPath.section == 0 && ownerCellIndexPath.row ==1)
        # This is the second row in the first section
      #end
    end
  end

  def tableView(tableView, didSelectRowAtIndexPath: indexPath)
    NSLog("Section: #{indexPath.section}, Cell: #{indexPath.row} is selected")
  end
end
