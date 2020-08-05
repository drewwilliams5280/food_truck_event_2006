class FoodTruck

  attr_reader :name, :inventory
  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    if @inventory.keys.include?(item)
      @inventory[item]
    else
      0
    end
  end

  def stock(item, quantity)
    @inventory[item] = quantity + check_stock(item)
  end

  def potential_revenue
    total = 0
    @inventory.each do |item, quantity|
      total += item.price * quantity
    end
    total
  end

end
