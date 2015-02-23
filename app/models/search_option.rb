class SearchOption
  # Class methods:
  class << self
    attr_reader :all
  end

  def self.init
    @all = prepare_search_options
  end

  def self.count
    all.count
  end

  def self.find index
    all.find{|option| option.index == index }
  end

  def self.only_truthful
    all.select{|option| option.is_set? }
  end


  # Instance methods:
  attr_reader :index, :name, :value

  def initialize name, index
    @name = name
    @index = index
    @value = true
  end

  def is_set?
    self.value
  end

  def set status
    @value = status
  end

  private

  def self.prepare_search_options
    Section.all.map.with_index { |section, index|
      SearchOption.new( section.name, index )
    }
  end
end
