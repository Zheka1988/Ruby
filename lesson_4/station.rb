class Station
  attr_reader :name, :trains
  def initialize(name)
    @name = name
    @trains = []
#    @carriages = []
  end
=begin
  def carriage_added(carriage)
    @carriages << carriage
  end
=end
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
end
