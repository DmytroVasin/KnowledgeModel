class Question < Base
  def self.attr_list
    [:id, :question, :answer]
  end
  attr_accessor *attr_list

  def self.load_by_options
    # Question.find(12)
    get_random( SearchOption.only_truthful ) || init_default
  end

  # def self.find id
  #   query = "Select #{table_attrs('q')} from questions q Where q.id = #{id}"
  #   execute(query).first
  # end

  private

  def self.get_random options
    if options.any?
      query = "SELECT #{table_attrs('q')} FROM questions q \
               INNER JOIN sections s ON q.section_id = s.id \
               WHERE "

      query << options.map{ |option| "s.name = '#{option.name}'" }.join(' OR ')

      query << ' ORDER BY RANDOM() LIMIT 1'

      puts "Query: #{query}"
      execute(query){ self.new }.first
    else
      puts 'Search option is empty'
    end
  end

  def self.init_default
    self.new.tap{|instance|
      instance.question = instance.answer = 'Вы не выбрали ниодной категории.'
    }
  end
end
