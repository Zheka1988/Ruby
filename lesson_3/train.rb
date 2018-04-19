class Train
  attr_reader :speed
  attr_reader :type, :number, :count_railway_carriage, :route, :position_station

  def initialize(number, type,  count_railway_carriage)
    @number = number
    @type = type
    @count_railway_carriage = count_railway_carriage
    @speed = 0
    @route = []
    @position_station = 0
  end


  def up_speed(speed)
    @speed += speed
  end

  def down_speed(speed)
    @speed -= speed
    @speed = 0 if @speed < 0
  end

  def add_railway_carriage
    if @speed == 0
      @count_railway_carriage += 1
    else
      puts "Поезд находится в движении, скорость = #{@speed}"
    end
  end

  def remove_railway_carriage
    if @speed == 0
      @count_railway_carriage -= 1 if @count_railway_carriage > 0
    else
      puts "Поезд находится в движении, скорость = #{@speed}"
    end
  end

  def routes(route)
     @route = route
     @route.first_station.train_arrived(self)
  end

  def go_next_station
    if  @route.all_stations[@position_station] == @route.finish_station
       puts "Мы на последней станции #{@route.all_stations[@position_station].name}"
    else
      @route.all_stations[@position_station].train_left(self)
      @position_station += 1
      @route.all_stations[@position_station].train_arrived(self)
    end
  end

  def go_past_station
    if @route.all_stations[@position_station] == @route.first_station
      puts "Мы на первой станции #{@route.all_stations[@position_station].name}"
    else
      @route.all_stations[@position_station].train_left(self)
      @position_station -= 1
      @route.all_stations[@position_station].train_arrived(self)
    end
  end

  def station_near
      @station_near = []
    if @route.all_stations[@position_station] == @route.first_station
      @station_near << @route.first_station
      @station_near << @route.all_stations[@position_station + 1]
    elsif @route.all_stations[@position_station] == @route.finish_station
      @station_near << @route.all_stations[@position_station - 1]
      @station_near << @route.finish_station  
    else
      @station_near << @route.all_stations[@position_station - 1]
      @station_near << @route.all_stations[@position_station]
      @station_near << @route.all_stations[@position_station + 1]
    end
  end  
end
