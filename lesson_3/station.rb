#require_relative 'train'
class Station
  @@trains = {}
  attr_accessor :name

  def initialize(name)
    self.name = name
  end

  def train_arrived(train = Train.new) 
    @@trains[train.number] = { train.type=>train.count_railway_carriage }
  end

  def all_trains
    @@trains.each { |key, value| puts "Поезд № #{key}" }
  end

  def list_count_railway_carriage(type)
    @@trains.each { |key, value| puts key if value.include?(type) }     
  end

  def train_left(number_train)
    @@trains.delete(number_train)
    puts "Поезд с номер #{number_train} уехал!!"
  end

end
