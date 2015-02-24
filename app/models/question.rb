class Question
  # TODO: When query returns empty array - app will down!
  def self.attr_list
    [:id, :question, :answer]
  end
  attr_accessor *attr_list


  def self.load_by_options
    Question.get_random( SearchOption.only_truthful ) || init_default
  end

  def self.get_random options
    if options.any?
      query = "SELECT #{table_attrs('q')} FROM questions q \
               INNER JOIN sections s ON q.section_id = s.id \
               WHERE "

      query << options.map{ |option| "s.name = '#{option.name}'" }.join(' OR ')

      query << ' ORDER BY RANDOM() LIMIT 1'

      puts "Query: #{query}"
      execute(query).first
    else
      puts 'Search option is empty'
    end
  end

  private
  def self.init_default
    self.new.tap{|instance|
      instance.question = instance.answer = 'Вы не выбрали ниодной категории.'
    }
  end

  # DRY
  def self.execute query
    Database.instance.execute(query) { Question.new }
  end

  def self.table_attrs table
    # TODO: Refactoring
    string = ''
    attr_list.each do |x|
      string += "#{table}.#{x}"
      string += ', ' if x != attr_list[-1]
    end
    string
  end
end
