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
    truck_names = @food_trucks.map do |truck|
      truck.name
    end
    truck_names
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all do |truck|
      truck.check_stock(item) > 0
    end
  end

  def total_inventory
    @food_trucks.reduce(Hash.new{ |h,k| h[k] = {:quantity => 0, :food_trucks => [] }}) do |hash, food_truck|
      food_truck.inventory.each do |item, amount|
        hash[0][:quantity] += amount #getting symbol to integer conversion error but in pry both come out as integer
        hash[item][:food_trucks] << food_truck
      end
    end
    hash
  end
end
