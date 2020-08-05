require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/item'
require './lib/food_truck'

class FoodTruckTest < Minitest::Test

  def test_it_exists_with_attributes
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    assert_instance_of FoodTruck, food_truck
    assert_equal "Rocky Mountain Pies", food_truck.name
    assert_equal Hash.new, food_truck.inventory
  end

  def test_it_can_check_stock_of_item_and_add_stock
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    assert_equal 0, food_truck.check_stock(item1)
    food_truck.stock(item1, 30)
    new_inventory = {item1 => 30}
    assert_equal new_inventory, food_truck.inventory
    assert_equal 30, food_truck.check_stock(item1)
  end


end
