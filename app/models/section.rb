class Section < Base
  def self.attr_list
    [:id, :name]
  end
  attr_accessor *attr_list

  def self.all
    query = "SELECT #{table_attrs('s')} FROM sections s"
    execute(query) { self.new }
  end
end
