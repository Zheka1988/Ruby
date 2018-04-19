class Route
  attr_accessor :first_station, :finish_station
  def initialize(first_station, finish_station, *intermediate)
    @first_station = first_station
    @finish_station = finish_station
    @intermediate_stations = intermediate
    @all_stations = []
  end

  def all_stations
    @all_stations = []
    @all_stations << first_station
    @all_stations += @intermediate_stations
    @all_stations << finish_station
  end

  def add_station(station)
    @intermediate_stations << station
  end

  def delete_station(station)
    @all_stations.delete(station)
  end

  def get_stations
   all_stations.each.with_index(1) { |station, index| puts  "Station number #{index} - #{station.name}" }
  end
end
