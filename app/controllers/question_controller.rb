class QuestionController < ApplicationController
  def viewWillDisappear animated
    set_content_size @text_question
  end

  def viewWillAppear animated
    set_content_size @text_question
  end

  def loadView
    load_random_question

    self.automaticallyAdjustsScrollViewInsets = false

    @question_view = QuestionView.alloc.initWithFrame(UIScreen.mainScreen.bounds, text_question(@question.question))
    @question_view.question_controller = self

    self.view = @question_view


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
    bound = UIScreen.mainScreen.bounds
    @bound_x = bound.origin.x + 20
    @bound_y = bound.origin.y + 20
    @bound_w = bound.size.width - 80
    @bound_h = bound.size.height - 135

    @text_question ||= UITextView.alloc.initWithFrame(CGRectZero).tap do |scroll_view|
      scroll_view.styleId = 'label_question'

      scroll_view.text = prepare_question(question)

      scroll_view.frame = [
        [@bound_x, @bound_y],
        [@bound_w, @bound_h]
      ]

      scroll_view.alwaysBounceVertical = false

      scroll_view.editable = false
      scroll_view.selectable = false

      scroll_view.addObserver(self, forKeyPath: 'contentSize', options: NSKeyValueObservingOptionNew, context: '1')

      scroll_view.textAlignment = UITextAlignmentCenter
      scroll_view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight
    end
  end

  def observeValueForKeyPath keyPath, ofObject: object, change: change, context: context
    set_content_size object
  end

  private
  def load_random_question
    @question = Question.load_by_options
  end

  def set_content_size object
    topCorrect = (object.bounds.size.height - object.contentSize.height)/2.0
    topCorrect = ( topCorrect < 0 ? 0 : topCorrect )

    @bottomOffset = CGPointMake(0, -topCorrect);

    if object.contentSize.height < object.bounds.size.height
      object.setContentOffset(@bottomOffset, animated: false)
    end
  end

  def prepare_question(question)
    # Tricky hack...
    "\n#{question}\n"
  end
end
