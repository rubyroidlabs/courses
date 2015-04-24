require 'test_helper'

class BeerTest < ActiveSupport::TestCase
  test "that i love Alivaria" do
    beer = Beer.find_by(name: 'Alivaria')
    assert beer.i_love_it == 'Tak'
  end

  test "that i rename beers" do
    beer = Beer.first
    assert beer.update_attributes(name: 'Guineess')
  end

  test "that i love Lidskoye" do
    beer = Beer.find_by(name: 'Lidskoye')
    assert beer.i_love_it == 'Ne'
  end

end
