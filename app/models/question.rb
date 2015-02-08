class Question < CDQManagedObject
  # scope :find_by_id, where(:id).eq(1)
  # scope :random, all.to_a.sample

  class << self
    def load_random
      Question.all.to_a.sample
    end

    def identify id
      Question.where(:id).eq(id).first.answer
    end
  end
end
