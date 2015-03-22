class SearchOption
  # Class methods:
  class << self
    attr_reader :all

    def init
      @all = prepare_search_options
      # @@state_is_changed = false
    end

    def count
      all.count
    end

    def find_by_name name
      all.find{|option| option.name == name }
    end

    def only_truthful
      all.select{|option| option.is_set? }
    end

    # def is_changed?
    #   is_changed = @@state_is_changed
    #   @@state_is_changed = false if @@state_is_changed

    #   is_changed
    # end
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
    # @@state_is_changed = true
    Question.is_changed = true
    @value = status
  end

  private

  def self.prepare_search_options
    Section.all.map.with_index { |section, index|
      SearchOption.new( section.name, index )
    }
  end
end
