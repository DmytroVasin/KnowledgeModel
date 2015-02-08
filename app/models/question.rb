class Question < CDQManagedObject
  # scope :find_by_id {|id| where(:id).eq(id).first }
  # scope :random, all.to_a.sample

  class << self
    def load_random
      Question.all.to_a.sample
      # Question.random
    end

    def get_answer_by id
      Question.where(:id).eq(id).first.answer
      # Question.find_by_id(id).answer
    end
  end
end
