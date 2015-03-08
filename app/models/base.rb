class Base
  private
  def self.table_attrs table
    attr_list.map{|atr| "#{table}.#{atr}" }.join(',')
  end

  def self.execute query, &block
    Database.instance.execute(query, &block)
  end
end
