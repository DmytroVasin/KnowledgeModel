class Question
  # TODO: When query returns empty array - app will down!
  def self.attr_list
    [:id, :question, :answer]
  end
  attr_accessor *attr_list


  def self.load_with_options
    Question.where( SearchOption.only_truthful ).sample
  end

  def self.find id
    query = "SELECT #{table_attrs('q')} FROM questions q WHERE id = #{id}"
    execute(query).first
  end

  def self.where options
    query = "SELECT #{table_attrs('q')} FROM questions q \
             INNER JOIN sections s ON q.section_id = s.id \
             WHERE "

    query << options.map{ |option| "s.name = '#{option.name}'" }.join(' OR ')

    query << ' ORDER BY RANDOM()'

    puts "Query: #{query}"

    execute(query)
  end

  private
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
