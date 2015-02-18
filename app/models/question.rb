class Question < CDQManagedObject
  scope :find_by_id {|_id| where(:id).eq(_id) }

  # scope :zzz, where(:id).eq(1)
  scope :with_category {|category_name| where(:name).eq(category_name) }

  def self.load_by_options
    opts = SearchOptions.options.select{|key, val| val }.keys

    puts '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
    puts opts
    puts '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'

    results = opts.inject(Question.all) do |result, name|
      puts '--------------'
      puts result
      puts name
      puts '--------------'

      result.with_category(name)
    end

    # results.to_a.sample
    puts '***************************'
    puts results.to_a
    puts '***************************'
    Question.find_by_id(1).first
  end

  def self.get_answer_by id
    get_record(id).answer
  end

  private
  def self.get_record id
    Question.find_by_id(id).first
  end
end
