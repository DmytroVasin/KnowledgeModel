class Database
  def self.instance
    self.new
  end

  def execute(query)
    results = []
    callback = ->(_context, count, values_array_ptr, column_names_array_ptr){
      row_obj = yield
      count.times do |column_number|
        column_name = column_names_array_ptr[column_number]
        value = values_array_ptr[column_number]

        row_obj.send(:"#{column_name}=", value)
      end

      results << row_obj

      return 0
    }
    error_ptr = Pointer.new(:string)
    sqlite3_exec(@database, query, callback, nil, error_ptr)
    raise "Query error: #{query} #{error_ptr.value}" if error_ptr.value

    results
  end

  private
  def initialize
    db_ptr = Pointer.new(Sqlite3.type)
    path = File.join(App.resources_path,'data.sqlite')

    unless sqlite3_open(path, db_ptr) == SQLITE_OK
      raise "Couldn't open the database!!"
    end

    @database = db_ptr.value
  end

  def dealloc
    # We need this?
    sqlite3_close(@database)
  end

end
