require 'minitest/autorun'
require 'minitest/pride'
require './lib/patron'

class PatronTest < Minitest::Test

  def setup
    @patron_1 = Patron.new("Bob", 20)
  end

  def test_it_can_exist
    assert_instance_of Patron, @patron_1
  end

end
