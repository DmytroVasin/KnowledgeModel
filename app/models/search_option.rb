class SearchOptions
  def self.options
    @options ||= {
      'Ruby' => true,
      'Rails' => true
    }
  end

  def self.options_array
    @options_array ||= ['Ruby', 'Rails']
  end

  def self.change_status_for index, status
    key = @options_array[index]

    @options[key] = status
  end
end
