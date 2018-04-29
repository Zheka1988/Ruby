class Train
  attr_reader :speed, :number, :carriages, :route, :type
  def initialize(number, type)
    @number = number
    @carriages = []
    @speed = 0
    @type = type
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
      puts @route.number_route
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

  def remove_carriage(carriage)
    if @speed == 0 && !@carriages.empty?
      @carriages.delete(carriage)
      #carriage.station = self.current_station
      puts "Вагон отцеплен от поезда"
    else
      puts "Поезд в движении"
    end
  end

  def add_carriage(carriage)
    if @speed == 0
      @carriages << carriage
      puts "Прицеплен Вагон с номером #{carriage.number}" ## ------------------------------metka
    else
      puts "Поезд в движении"
    end
  end


end
