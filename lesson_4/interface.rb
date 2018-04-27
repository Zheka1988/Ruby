class Interfeis
  attr_reader :stations, :trains, :routes
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
      puts "=========================================="
      puts "Введите название станции"
      name_station = gets.chomp
      if @stations.find { |station| station.name == name_station }
        puts "Такая станция уже существует!"
      else
        @stations << Station.new(name_station)
      end
      @stations.each.with_index(1) { |station, index| puts "Cтанция #{index} - #{station.name}" }
    when 2
      puts "=========================================="
      puts "Введите номер поезда"
      number_train = gets.to_i
      if @trains.find { |train|  train.number == number_train }
        puts "Такой поезд уже существует!"
      else
        puts "Введите 0 - пассажирский"
        puts "Введите 1 - грузовой"
        b = gets.to_i
        if b == 1
          @trains << CargoTrain.new(number_train)
        else
          @trains << PassengerTrain.new(number_train)
        end
      end
      @trains.each.with_index(1) { |train, index| puts "Поезд #{index} - #{train.number}"}
    when 3
      puts "=========================================="
      puts "Введите номер маршрута"
      number_route = gets.to_i
      if @routes.find { |route| route.number_route == number_route }
        puts "Такой маршрут уже существует!"
      else
        puts "Введите название первой станции"
        one_station = gets.chomp
        puts "Введите название последней станции"
        end_station = gets.chomp
        @routes << Route.new(@stations.find { |st| st.name == one_station }, @stations.find { |st| st.name == end_station }, number_route)
      end
      @routes.each.with_index(1) { |route, index| puts "Маршрут #{index} - #{route.number_route}"}
    when 4
      puts "=========================================="
      puts "Введите номер вагона"
      number_carriage = gets.to_i
      if @carriage.find {|carriage| carriage.number == number_carriage }
        puts "Такой вагон уже существует!"
      else
        puts "Введите название станции, на которой стоит вагон"
        station_name = gets.chomp
        puts "Выберите тип вагона"
        puts "1. Пассажирский"
        puts "2. Грузовой"
        a = gets.to_i
        if a == 1
          @carriages << PassengerCarriage.new(@stations.each { |station| station if station.name == station_name }, number_carriage)
        elsif a == 2
          @carriages << CargoCarriage.new(@stations.each { |station| station if station.name == station_name }, number_carriage)
        end
      end
      @carriages.each.with_index(1) { |carriage, index| puts "Вагон #{index} - #{carriage.number}, находится на станции #{carriage.station}"}
    else
       puts "=========================================="
       puts "Выберите число, соответствующее списку!!!"
    end
  end
end
