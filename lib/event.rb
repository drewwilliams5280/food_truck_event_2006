class Event

  attr_reader :name, :food_trucks
  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.map {|truck| truck.name}
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all do |truck|
      truck.check_stock(item) >= 1
    end
  end

  def all_items
    @food_trucks.map do |truck|
      truck.inventory.keys
    end.flatten.uniq
  end

  def total_quantity(item)
    total = 0
    @food_trucks.each do |truck|
      if truck.inventory.keys.include?(item)
        total += truck.inventory[item]
      end
    end
    total
  end

  def total_inventory
    inventory = {}
    all_items.each do |item|
      inventory[item] = {quantity: total_quantity(item), food_trucks: food_trucks_that_sell(item)}
    end
    inventory
  end

  def overstocked_items
    all_items.find_all do |item|
      total_quantity(item) > 50 && food_trucks_that_sell(item).count > 1
    end
  end

  def sorted_item_list
    all_items.map {|item| item.name}.sort
  end

  def sell(item, quantity)
    if quantity <= total_quantity(item) && all_items.include?(item)
      return true
      sell_stock(item, quantity)
    else
      return false
    end
  end

  def sell_stock(item, quantity)
    food_trucks_that_sell(item).each do |truck|
      if truck.check_stock(item) >= quantity
        truck.inventory[item] -= quantity
        quantity = 0
      else
        quantity = quantity - truck.inventory[item]
        truck.inventory[item] = 0
      end
    end
  end

end
