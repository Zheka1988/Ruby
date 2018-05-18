require_relative 'instance_counter'
class Station
  include InstanceCounter
  attr_reader :name, :trains

  NAME_STATION = /\A[а-яa-z0-9]{3,10}\Z/i
  @@stations = []

  def self.all
    @@stations
  end

  def initialize(name)
    @name = name
    @trains = []
    validate!
    @@stations << self
    register_instance
  end

  def train_arrived(train)
    raise if train.class != Train || @trains.find { |tr| tr.number == train.number}
    @trains << train
    puts "Поезд c номером #{train.number}, прибыл!"
  rescue
    puts "Нет сещуствует такого поезда или он уже стоит на этой станции!"
  ensure
    @trains
  end

  def count_by_type(type)
    @trains.count { |train|  train.type == type }
  end

  def train_left(train)
    @trains.delete(train)
    puts "Поезд с номером #{train.number} уехал!"
  end

  def valid?
    validate!
  rescue
    false
  end

  protected

  def validate!
    raise "Название станции включает (а-я,a-z,0-9), не зависимо от регистра, кол-во символов от 3 до 10!" if name !~ NAME_STATION
    true
  end
end
