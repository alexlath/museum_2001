class Patron
  attr_reader :name, :spending_money

  def initialize(name_param, spending_money_param)
    @name = name_param
    @spending_money = spending_money_param
  end
end
