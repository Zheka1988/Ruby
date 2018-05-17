require_relative 'instance_counter'
class Route
  include InstanceCounter
  attr_reader :stations, :number_route, :first_station, :finish_station

  NUMBER_FORMAT = /^\d{4}$/

  def initialize(first_station, finish_station, number)
    @stations = [first_station, finish_station]
    @number_route = number
    validate!
    register_instance!
  end

  def add_station(station)
    @stations.insert(-2, station)
    show_stations
  end

  def delete_station(station)
    if station != @stations[0] && station != @stations[-1]
      @stations.delete(station)
      show_stations
    else
      puts "Эта станция не может быть удалена!"
    end
  end

  def show_stations
    puts "Маршрут содержит станции: "
    @stations.each.with_index(1) { |station, index| puts  "Station number #{index} - #{station.name}" }
  end

  def change_number_route(number)
    @number_route = number
  end

  def valid?
    if validate!
      true
    else
      false
    end
  end

  protected

  def validate!
    raise "Номер маршрута состоит из 4 цифр" if number_route.to_s !~ NUMBER_FORMAT
    true
  end

end
