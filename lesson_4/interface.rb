class Interface
  attr_reader :stations, :trains, :routes, :carriages
  def initialize
    @stations = []
    @trains = []
    @routes = []
    @carriages = []
  end

  def create_object
    puts "=========================================="
    puts "1. Создать станцию"
    puts "2. Создать поезд"
    puts "3. Создать маршрут"
    puts "4. Создать вагон"
    a = gets.to_i
    case a
    when 1
      loop do
        puts "=========================================="
        puts "Введите название станции или \"x\" если хотите в главное меню"
        name_station = gets.chomp
      break if name_station == 'x'
        if station_exist?(name_station)
          puts "Станция с таким названием уже существует!"
        else
          @stations << Station.new(name_station)
        end
        @stations.each.with_index(1) { |station, index| puts "Cтанция #{index} - \"#{station.name}\"" }
      end
    when 2
      loop do
        puts "=========================================="
        puts "Введите номер поезда или \"0\" если хотите выйти в главное меню"
        number_train = gets.to_i
        if number_train == 0 || train_exist?(number_train)
      break if number_train == 0
          puts "Поезд с таким номером уже существует!"
        else
          begin
            puts "Введите 1 - грузовой"
            puts "Введите 2 - пассажирский"
            b = gets.to_i
          end until b == 1 || b == 2
          if b == 1
            @trains << CargoTrain.new(number_train)
          else
            @trains << PassengerTrain.new(number_train)
          end
        end
        @trains.each.with_index(1) { |train, index| puts "Поезд #{index} - #{train.number}, тип поезда - " + output_type(train.type) }
      end
    when 3
      loop do
        puts "=========================================="
        puts "Введите номер маршрута или \"0\" если хотите выйти в главное меню"
        number_route = gets.to_i
        if number_route == 0 || route_exist?(number_route)
      break if number_route == 0
          puts "Маршрут с таким номером уже существует!"
          @routes.each.with_index(1) do |route, index|
            puts "Маршрут #{index} - #{route.number_route}, первая станция \"#{route.stations[0].name}\", последняя станция \"#{route.stations[-1].name}\""
          end
        else
          puts "Введите название первой станции"
          one_station = gets.chomp
          puts "Введите название последней станции"
          end_station = gets.chomp
          if !station_exist?(one_station) || !station_exist?(end_station)
            puts "Убедитесь в существовании введенных станций!"
          else
            @routes << Route.new(@stations.find { |st| st.name == one_station }, @stations.find { |st| st.name == end_station }, number_route)
            @routes.each.with_index(1) do |route, index|
              puts "Маршрут #{index} - #{route.number_route}, первая станция \"#{route.stations[0].name}\", последняя станция \"#{route.stations[-1].name}\""
            end
          end
        end
      end
    when 4
      loop do
        puts "=========================================="
        puts "Введите номер вагона или \"0\" если хотите выйти в главное меню"
        number_carriage = gets.to_i
        if number_carriage == 0 || carriage_exist?(number_carriage)
      break if number_carriage == 0
          puts "Вагон с таким номером уже существует!"
          @carriages.each.with_index(1) { |carriage, index| puts "Вагон #{index} - #{carriage.number}, находится на станции \"#{carriage.station.name}\", тип вагона - " + output_type(carriage.type) }
        else
=begin
          puts "Введите название станции, на которой стоит вагон"
          station_name = gets.chomp
          if !station_exist?(station_name)
            puts "Убедитесь в существовании введенной станции!"
          else
=end
            begin
              puts "Выберите тип вагона"
              puts "1. Грузовой"
              puts "2. Пассажирский"
              a = gets.to_i
            end until a == 1 || a == 2
            if a == 2
              @carriages << PassengerCarriage.new(number_carriage) #,@stations.find { |station| station.name == station_name }
            else
              @carriages << CargoCarriage.new(number_carriage) #@stations.find { |station| station.name == station_name },
            end
            @carriages.each.with_index(1) { |carriage, index| puts "Вагон #{index} - #{carriage.number}, тип вагона - " + output_type(carriage.type) } #, находится на станции \"#{carriage.station.name}\"
#          end
        end
      end
    else
      puts "=========================================="
      puts "Выберите число, соответствующее списку!!!"
    end
  end

  def add_station(number_route, name_station)
    @routes.each do |route|
      route.add_station(@stations.find { |st| st.name ==name_station }) if route.number_route == number_route
    end
  end

  def del_station(number_route, name_station)
    @routes.each do |route|
      route.delete_station(@stations.find { |st| st.name ==name_station }) if route.number_route == number_route
    end
  end

  def station_exist?(name_station)
    @stations.find { |station| station.name == name_station }
  end

  def route_exist?(number)
    @routes.find { |route| route.number_route == number }
  end

  def carriage_exist?(number_carriage)
    @carriages.find {|carriage| carriage.number == number_carriage }
  end

  def train_exist?(number_train)
    #puts number_train
    #@trains.each { |train| puts "p - #{train.number}" }
    @trains.find { |train|  train.number == number_train  }
  end

  def output_type(type)
      if  type == 'C'
        'грузовой'
      else
        'пасажирский'
      end
  end
=begin
  def stations_equal?(number_carriage, number_train)
    station_train = nil
    station_carriage = nil
    @trains.each {| train| station_train = train.current_station if train.number == number_train}
    @carriages.each { |carriage| station_carriage = carriage.station if carriage.number == number_carriage }

    if station_train == station_carriage
      true
    else
      false
    end
  end
=end

end
