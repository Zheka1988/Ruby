class Train
  attr_reader :speed
  attr_accessor :type, :number, :count_railway_carriage

  def initialize(number = "100", type = "p",  count_railway_carriage = 1)
    self.number = number
    self.type = type
    self.count_railway_carriage = count_railway_carriage
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

  def sub_railway_carriage
    if @speed == 0
      @count_railway_carriage -= 1
    else
      puts "Поезд находится в движении, скорость = #{@speed}"
    end
  end

  def routes(route = Route.new)
     @current_station = route.stations[@position_station]  
     @route = route.stations
     puts @route
     puts @current_station
  end
  def next_station
    @position_station += 1
    if @position_station > @route.length - 1
      @position_station -= 1
      puts "Мы на последней станции #{@route[@position_station]}" 
      
    else
      @current_station = @route[@position_station]
    end
  end

  def past_station
    @position_station -= 1
    if @position_station < 0
      @position_station = 0 
      puts "Мы на первой станции #{@route[@position_station]}"
    else
    @current_station = @route[@position_station]
    end
  end

  def station_near
    puts "Предыдущая станция #{@route[@position_station - 1]}"
    puts "Текущая станция #{@route[@position_station]}"
    puts "Следующая станция #{@route[@position_station + 1]}"
  end
end
