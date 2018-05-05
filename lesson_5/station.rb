require_relative 'all_objects'
class Station
  include All_objects
  attr_reader :name, :trains
  def initialize(name)
    @name = name
    @trains = []
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
   # puts "ghbdtn"
    All_objects::get_stations #здесь
  end
end
