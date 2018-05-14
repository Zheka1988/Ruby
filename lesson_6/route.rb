require_relative 'instance_counter'
class Route
  include InstanceCounter
  attr_reader :stations, :number_route, :first_station, :finish_station
  def initialize(first_station, finish_station, number)
    @stations = [first_station, finish_station]
    @number_route = number
    self.register_instance
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
      puts "The station can not be removed!!"
    end
  end

  def show_stations
    puts "Маршрут содержит станции: "
    @stations.each.with_index(1) { |station, index| puts  "Station number #{index} - #{station.name}" }
  end

  def change_number_route(number)
    @number_route = number
  end
end
