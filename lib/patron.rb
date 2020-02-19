class Patron
  attr_reader :name, :spending_money, :interests

  def initialize(name_param, spending_money_param)
    @name = name_param
    @spending_money = spending_money_param
    @interests = []
  end
end
