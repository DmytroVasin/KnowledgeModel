class SearchOptions
  def self.options
    @options ||= get_options_hash
  end

  def self.options_array
    @options_array ||= sections.map(&:name)
  end

  def self.change_status_for index, status
    key = @options_array[index]

    @options[key] = status
  end

  private
  def self.sections
    @sections ||= Section.all
  end

  def self.get_options_hash
    sections.inject(Hash.new){|h,row| h.merge(row.name => true)}
  end
end
