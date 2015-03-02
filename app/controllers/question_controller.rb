class QuestionController < ApplicationController

  def viewWillDisappear animated
    puts '******************* СКРЫТЬ **********************'
    puts @text_question.text
    puts @text_question.bounds.size.height
    puts @text_question.contentSize.height
    puts '******************* СКРЫТЬ **********************'


    tv = @text_question


      # puts '>>>>>>>>>>>>>>'
      # puts tv.bounds.size.height
      # puts tv.contentSize.height
      # puts '>>>>>>>>>>>>>>'

    topCorrect = (tv.bounds.size.height - tv.contentSize.height)/2.0
    topCorrect = ( topCorrect < 0 ? 0 : topCorrect )

    bottomOffset = CGPointMake(0, -topCorrect);

    if tv.contentSize.height < tv.bounds.size.height
      tv.setContentOffset(bottomOffset, animated: false);
    end
  end

  def viewWillAppear animated
    puts '******************* СКРЫТЬ **********************'
    puts @text_question.text
    puts @text_question.bounds.size.height
    puts @text_question.contentSize.height
    puts '******************* СКРЫТЬ **********************'


    tv = @text_question


      # puts '>>>>>>>>>>>>>>'
      # puts tv.bounds.size.height
      # puts tv.contentSize.height
      # puts '>>>>>>>>>>>>>>'

    topCorrect = (tv.bounds.size.height - tv.contentSize.height)/2.0
    topCorrect = ( topCorrect < 0 ? 0 : topCorrect )

    bottomOffset = CGPointMake(0, -topCorrect);

    if tv.contentSize.height < tv.bounds.size.height
      tv.setContentOffset(bottomOffset, animated: false);
    end
  end

  def loadView
    load_random_question

    self.automaticallyAdjustsScrollViewInsets = false

    self.view = QuestionView.alloc.initWithFrame(UIScreen.mainScreen.bounds, @question.question, text_question(@question.question))
    self.view.question_controller = self

    self.view.when_swiped{ next_question_action }.direction = UISwipeGestureRecognizerDirectionLeft
    self.view.when_swiped{ setup_action }.direction = UISwipeGestureRecognizerDirectionUp
    self.view.when_swiped{ get_answer }.direction = UISwipeGestureRecognizerDirectionRight
  end

  def get_answer
    answer_controller = AnswerController.new.tap {|controller|
      controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal
      controller.answer = @question.answer
    }

    show_modal(answer_controller)
  end








  def text_question question
    @text_question ||= UITextView.alloc.initWithFrame(CGRectZero).tap do |scroll_view|
      scroll_view.styleId = 'label_question'

      scroll_view.text = 'Neither'

      scroll_view.frame = [
        [20, 20],
        # [self.frame.size.width - 40, self.frame.size.height - 40]
        [300, 300]
      ]

      scroll_view.alwaysBounceVertical = false

      scroll_view.editable = false
      scroll_view.selectable = false

      scroll_view.addObserver(self, forKeyPath: 'contentSize', options: NSKeyValueObservingOptionNew, context: nil)

      scroll_view.textAlignment = UITextAlignmentCenter
      scroll_view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight

      puts '>>>>>>>>>>>>>>'
      puts scroll_view.bounds.size.height
      puts scroll_view.contentSize.height
      puts '>>>>>>>>>>>>>>'
    end
  end

  def observeValueForKeyPath keyPath, ofObject: object, change: change, context: context
    tv = object


      puts '>>>>>>>>>>>>>>'
      puts tv.bounds.size.height
      puts tv.contentSize.height
      puts '>>>>>>>>>>>>>>'

    topCorrect = (tv.bounds.size.height - tv.contentSize.height)/2.0
    topCorrect = ( topCorrect < 0 ? 0 : topCorrect )

    bottomOffset = CGPointMake(0, -topCorrect);

    if tv.contentSize.height < tv.bounds.size.height
      tv.setContentOffset(bottomOffset, animated: false);
    end
  end






















  private
  def load_random_question
    @question = Question.load_by_options
  end
end
