class Station
  attr_accessor :name
  def initialize(name)
    self.name = name
    @trains = {}
  end

  def train_arrived(train)
    @trains[train.number] = { train.type=>train.count_railway_carriage }
  end

  def all_trains
    @trains.keys
  end

  def list_count_railway_carriage(type)
    count = 0
    @trains.each { |number, value| count += 1 if value.key?(type) }
    count
  end

  def train_left(train)
    @trains.delete(train.number)
    puts "Поезд с номер #{train.number} уехал!!"
  end
end
