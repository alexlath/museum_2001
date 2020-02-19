class Museum
  attr_reader :name, :exhibits, :patrons

  def initialize(name_param)
    @name = name_param
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit_param)
    @exhibits << exhibit_param
  end

  def recommend_exhibits(patron_param)
    @exhibits.select { |exhibit| patron_param.interests.include?(exhibit.name) }
  end

end
