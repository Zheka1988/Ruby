class Route
  attr_reader :stations
  def initialize(first_station, finish_station)
    @stations = [first_station, finish_station]
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def delete_station(station)
    if station != @stations[0] && station != @stations[-1]
      @stations.delete(station)
    else
      puts "The station can not be removed!!"
    end
  end

  def show_stations
    @stations.each.with_index(1) { |station, index| puts  "Station number #{index} - #{station.name}" }
  end
end
