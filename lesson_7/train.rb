require_relative 'manufacturer'
require_relative 'instance_counter'
class Train

  include Manufacturer
  include InstanceCounter
  @@trains = {}
  NUMBER_FORMAT = /\A[а-яa-z0-9]{3}\-?[а-яa-z0-9]{2}\Z/ui

  attr_reader :speed, :number, :carriages, :route, :type
  def self.find(number)
    @@trains[number]
  end

  def initialize(number, type)
    @number = number
    @carriages = []
    @speed = 0
    @type = type
    validate!
    @@trains[number] = self
    register_instance
  end

  def validate!
    raise "Не корректно введен номер!" if number !~ NUMBER_FORMAT
    true
  end

  def up_speed(speed)
    @speed += speed
  end

  def down_speed(speed)
    @speed -= speed
    @speed = 0 if @speed < 0
  end

  def routes(route)
    @route = route
    @route.stations[0].train_arrived(self)
    @position_station = 0
    @route.number_route
  end

  def go_next_station
    if current_station == @route.stations[-1]
      current_station.name
    else
      current_station.train_left(self)
      @position_station += 1
      current_station.train_arrived(self)
    end
  end

  def go_past_station
    if @route.stations[@position_station] == @route.stations[0]
      current_station.name
    else
      current_station.train_left(self)
      @position_station -= 1
      current_station.train_arrived(self)
    end
  end

  def next_station
    @route.stations[@position_station + 1] if current_station != @route.stations[-1]
  end

  def past_station
    @route.stations[@position_station - 1] if current_station != @route.stations[0]
  end

  def current_station
    @route.stations[@position_station]
  end

  def remove_carriage(carriage)
    @carriages.delete(carriage) if @speed == 0 && !@carriages.empty?
  end

  def add_carriage(carriage)
    @carriages << carriageif if @speed == 0
  end
end
