class Question < Base
  def self.attr_list
    [:id, :question, :answer]
  end
  attr_accessor *attr_list

  class << self
    attr_accessor :is_changed
  end

  def self.load_by_options
    return init_default if random_ids.empty?

    id = calculate_current_id
    Question.find(random_ids[id])
  end

  private
  def self.calculate_current_id
    if @current_id && @current_id < (random_ids.count - 1)
      @current_id += 1
    else
      @current_id = 0
    end
  end

  def self.random_ids
    shuffle_ids if @is_changed
    @random_ids ||= get_random_question_ids(SearchOption.only_truthful)
  end

  def self.shuffle_ids
    @random_ids = get_random_question_ids(SearchOption.only_truthful)
    @is_changed = false
  end

  def self.get_random_question_ids options
    return [] if options.none?

    query = "SELECT q.id FROM questions q \
             INNER JOIN sections s ON q.section_id = s.id \
             WHERE "
    query << options.map{ |option| "s.name = '#{option.name}'" }.join(' OR ')
    query << ' ORDER BY RANDOM()'

    execute(query){ self.new }.map(&:id)
  end

  def self.find id
    query = "SELECT #{table_attrs('q')} FROM questions q WHERE q.id = #{id}"
    execute(query){ self.new }.first
  end

  def self.init_default
    self.new.tap{|instance|
      instance.question = instance.answer = 'Вы не выбрали ниодной категории.'
    }
  end
end
