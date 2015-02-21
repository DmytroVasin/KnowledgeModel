class Section
  def self.attr_list
    [:id, :name]
  end
  attr_accessor *attr_list

  def self.all
    query = "SELECT #{table_attrs('s')} FROM sections s"
    execute(query)
  end

  private
  # DRY
  def self.execute query
    Database.instance.execute(query) { Section.new }
  end

  # DRY
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
