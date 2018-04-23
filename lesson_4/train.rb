class Train
  attr_reader :speed, :number, :count_railway_carriage, :route #:type,

  def initialize(number) # ,count_railway_carriage, type,
    @number = number
    #@type = type
    @count_railway_carriage = []#count_railway_carriage
    @speed = 0
  end


  def add_vagon(vagon)
    add_railway_carriage(vagon)
  end

  def remove_vagon(vagon)
    remove_railway_carriage(vagon)
  end

  def up_speed(speed)
    @speed += speed
  end

  def down_speed(speed)
    @speed -= speed
    @speed = 0 if @speed < 0
  end

  def routes(route)
    @route = route
    @route.stations[0].train_arrived(self)
    @position_station = 0
  end

  def go_next_station
    if current_station == @route.stations[-1]
      puts "Мы на последней станции #{current_station.name}"
    else
      current_station.train_left(self)
      @position_station += 1
      current_station.train_arrived(self)
    end
  end

  def go_past_station
    if @route.stations[@position_station] == @route.stations[0]
      puts "Мы на первой станции #{current_station.name}"
    else
      current_station.train_left(self)
      @position_station -= 1
      current_station.train_arrived(self)
    end
  end

  def next_station
   @route.stations[@position_station + 1] if current_station != @route.stations[-1]
  end

  def past_station
    @route.stations[position_station - 1] if current_station != @route.stations[0]
  end

  def current_station
    @route.stations[position_station]
  end

  protected  #не интересен процесс удаления и добавления вагонов, главное что это возможно
  def add_railway_carriage(vagon)
    if @speed == 0 && vagon.type == self.type
     @count_railway_carriage << vagon
    else
      puts "Поезд находится в движении, скорость = #{@speed} или не совпадают типы вагонов"
    end
  end

  def remove_railway_carriage(vagon)
    if @speed == 0 && @count_railway_carriage > 0
      @count_railway_carriage.delete(vagon)
    else
      puts "Нельзя удалить вагон!"
    end
  end


end
