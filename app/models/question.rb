class Question
  def self.attr_list
    [:id, :question, :answer]
  end
  attr_accessor *attr_list


  def self.load_by_options
    Question.where( SearchOptions.options ).sample
  end

  def self.find id
    query = "SELECT #{table_attrs('q')} FROM questions q WHERE id = #{id}"
    execute(query).first
  end

  def self.where option_hash
    query = "SELECT #{table_attrs('q')} FROM questions q \
             INNER JOIN sections s ON q.section_id = s.id \
             WHERE "

    query << option_hash.select{|_, v| v }.keys.map{ |value| "s.name = '#{value}'" }.join(' OR ')

    query << ' ORDER BY RANDOM()'

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
