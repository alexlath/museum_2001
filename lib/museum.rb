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

  def ticket_lottery_contestants(exhibit_param)
    @patrons.select do |patron|
      patron.spending_money < exhibit_param.cost &&
      patron.interests.include?(exhibit_param.name)
    end
  end

  def draw_lottery_winner(exhibit_param)
    if ticket_lottery_contestants(exhibit_param).length != 0
      ticket_lottery_contestants(exhibit_param).sample.name
    else
      nil
    end
  end

  def announce_lottery_winner(exhibit_param)
    winner = draw_lottery_winner(exhibit_param)
    if winner != nil
      "#{winner} has won the #{exhibit_param.name} exhibit lottery"
    else
      "No winners for this lottery"
    end
  end

end
