require_relative 'instance_counter'
require_relative 'validation'
require_relative 'accessors'
class Route
  include InstanceCounter
  extend Accessors
  include Validation
  attr_reader :stations, :first_station, :finish_station

  NUMBER_FORMAT = /^\d{4}$/

  attr_accessor_with_history :number_route
  strong_attr_accessor :extension, Float


  validate :number_route, :presence
  validate :number_route, :format, NUMBER_FORMAT
  validate :number_route, :type, String

  def initialize(first_station, finish_station, number)
    @stations = [first_station, finish_station]
    @number_route = number
    validate!
    register_instance
  end

  def add_station(station)
    str = 'Нет существует такой станции или она уже включена в маршрут!'
    raise str if station.class != Station || @stations.find do |stat|
      stat.name == station.name
    end
    raise 'Данная станция включена в маршрут' if @stations.find do |stat|
      stat == station
    end
    @stations.insert(-2, station)
  rescue StandardError => e
    puts e.message
  end

  def delete_station(station)
    if station != @stations[0] && station != @stations[-1]
      @stations.delete(station)
      show_stations
    else
      puts 'Эта станция не может быть удалена!'
    end
  end

  def show_stations
    @stations.each.with_index(1) do |station, index|
      puts "Station number #{index} - #{station.name}"
    end
  end

  def change_number_route(number)
    spare_number = @number_route
    @number_route = number
    if valid?
      puts "Номер изменен на #{number}"
    else
      @number_route = spare_number
    end
  end
end
