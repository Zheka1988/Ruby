class Station
  attr_reader :name, :trains
  @@stations = []
  def initialize(name)
    @name = name
    @trains = []
    @@stations << self
  end

  def train_arrived(train)
    @trains << train
    puts "Текущая станция #{@name}"
  end

  def count_by_type(type)
    @trains.count { |train|  train.type == type }
  end

  def train_left(train)
    @trains.delete(train)
    puts "Поезд с номером #{train.number} уехал!!"
  end

  def self.all
    @@stations
  end

end
