class SetupController < UIViewController
  def loadView
    self.view = SetupView.alloc.initWithFrame(UIScreen.mainScreen.bounds)
  end

  def back_to_main
    main_controller = MainController.new
    main_controller.modalTransitionStyle = UIModalTransitionStyleCoverVertical

    self.dismissModalViewControllerAnimated(true)
  end

  # def switch_is_changed sender
  #   ownerCell = sender.superview

  #   puts sender
  #   puts '<<<<<<<<<<<<<<<<<'
  #   unless (ownerCell == nil)
  #     puts '>>>>>>>>>>>>>>>>>>>'
  #     # index path of the cll which contains the section and row of the cell
  #     ownerCellIndexPath = @myTableView.indexPathForCell(ownerCell)

  #     #p "section = #{ownerCellIndexPath.section} and row = #{ownerCellIndexPath.row}"

  #     #if (ownerCellIndexPath.section == 0 && ownerCellIndexPath.row ==1)
  #       # This is the second row in the first section
  #     #end
  #   end
  # end
end

