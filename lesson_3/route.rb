class Route
  attr_writer :stations
  def initialize(*stations)
    self.stations = stations
  end

  def add_station(number_station, name_station)
    @stations.insert(number_station.to_i - 1, name_station)
  end

  def delete_station_name(name_station)
    @stations.delete(name_station)
  end

  def delete_station_number(number_station)
    @stations.delete_at(number_station)
  end

  def get_stations
    @stations.each.with_index(1) do |name_station, index| 
      puts "Станция номер #{index}. - #{name_station}"
    end
  end

end