require_relative 'all_objects'
require_relative 'instance_counter'
class Station
  extend All_objects
  include InstanceCounter::InstanceMethods
  extend InstanceCounter::ClassMethods
  attr_reader :name, :trains
  def initialize(name)
    @name = name
    @trains = []
    self.register_instance
    self.class.instances
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
    get_stations
  end
end
