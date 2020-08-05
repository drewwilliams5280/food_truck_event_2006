require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/item'

class ItemTest < Minitest::Test

  def test_it_exists
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    assert_instance_of Item, item1
    assert_instance_of Item, item2
  end


end
