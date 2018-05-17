require_relative 'manufacturer'
require_relative 'instance_counter'
class Train

  include Manufacturer
  include InstanceCounter
  NUMBER_FORMAT = /\A[а-яa-z0-9]{3}\-?[а-яa-z0-9]{2}\Z/i
  @@trains = {}
  attr_reader :speed, :number, :carriages, :route, :type
  def self.find(number)
    @@trains[number]
  end

  def initialize(number, type)
    @number = number
    @carriages = []
    @speed = 0
    @type = type
    a = 0
    begin
      puts "exception"
      validate!
    rescue
      #a += 1
      Interface.create_trains
      #retry if a < 2
    end
    #create_trains
    @@trains[number] = self
    register_instance
  end




  def validate!
    puts number
    raise "Не верно веден номер поезда" if number.to_s !~ NUMBER_FORMAT
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
      puts @route.number_route
  end

  def go_next_station
    if current_station == @route.stations[-1]
      puts "Мы на последней станции #{current_station.name}"
    else
      current_station.train_left(self)
      @position_station += 1
      current_station.train_arrived(self)
    end
  end

  def go_past_station
    if @route.stations[@position_station] == @route.stations[0]
      puts "Мы на первой станции #{current_station.name}"
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
    if @speed == 0 && !@carriages.empty?
      @carriages.delete(carriage)
      puts "Вагон отцеплен от поезда"
    else
      puts "Поезд в движении"
    end
  end

  def add_carriage(carriage)
    if @speed == 0
      @carriages << carriage
      puts "Прицеплен Вагон с номером #{carriage.number}"
    else
      puts "Поезд в движении"
    end
  end
end
