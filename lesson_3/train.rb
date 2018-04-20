class Train
  attr_reader :past_station, :next_station, :current_station, :type, :speed, :number, :count_railway_carriage, :route, :position_station

  def initialize(number, type,  count_railway_carriage)
    @number = number
    @type = type
    @count_railway_carriage = count_railway_carriage
    @speed = 0
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
    if @speed == 0 && @count_railway_carriage > 0
      @count_railway_carriage -= 1
    else
      puts "Нельзя удалить вагон!"
    end
  end

  def routes(route)
     @route = route
     @route.stations[0].train_arrived(self)
     @position_station = 0
     @next_station = @route.stations[position_station + 1]
     @past_station = nil
  end

  def go_next_station
    if  @route.stations[@position_station] == @route.stations[-1]
      puts "Мы на последней станции #{@route.stations[@position_station].name}"
    else
      @route.stations[@position_station].train_left(self)
      @position_station += 1
      @route.stations[@position_station].train_arrived(self)
    end
  end

  def go_past_station
    if @route.stations[@position_station] == @route.stations[0]
      puts "Мы на первой станции #{@route.stations[@position_station].name}"
    else
      @route.stations[@position_station].train_left(self)
      @position_station -= 1
      @route.stations[@position_station].train_arrived(self)
    end
  end

  def next_station
    if @route.stations[@position_station] == @route.stations[-1]
      @next_station = nil
    else
      next_station = @route.stations[@position_station + 1]
    end
  end

  def past_station
    if @route.stations[@position_station] == @route.stations[0]
      @past_station = nil
    else
      @past_station = @route.stations[position_station - 1]
    end
  end

  def current_station
    @current_station = @route.stations[position_station]
  end

end
