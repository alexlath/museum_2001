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

  def admit(patron_param)
    @patrons << patron_param
  end

  def patrons_by_exhibit_interest
    @exhibits.reduce({}) do |patrons_by_exhibit_interest, exhibit|
      patrons_by_exhibit_interest[exhibit] = @patrons.select do |patron|
        patron.interests.include?(exhibit.name)
      end
      patrons_by_exhibit_interest
    end
  end

end
