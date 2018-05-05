module All_objects
  attr_reader :obj_stations
  def all_stations(stations)
    @obj_stations = stations
    puts "#{@obj_stations}"
  end



end
