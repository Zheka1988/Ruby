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
        @stations << Station.new(name_station)
      when 2
        puts "=========================================="
        puts "Введите номер поезда"
        number_train = gets.to_i
        puts "Введите 0 - пассажирский"
        puts "Введите 1 - грузовой"
        b = gets.to_i
        if b == 1
          @trains << CargoTrain.new(number_train)
        else
          @trains << PassengerTrain.new(number_train)
        end
        puts @trains
      when 3
        puts "=========================================="
        puts "Введите номер маршрута"
        number_route = gets.to_i
        puts "Введите название первой станции"
        one_station = gets.chomp
        puts "Введите название последней станции"
        end_station = gets.chomp
        st1 = @stations.each { |st| st if st.name == one_station }
        @routes << Route.new(@stations.each { |st| st if st.name == one_station }, @stations.each { |st| st if st.name == end_station }, number_route)
        puts @routes
      when 4
        puts "=========================================="
        puts "Введите название станции, на которой стоит вагон"
        station_name = gets.chomp
        puts "Введите номер вагона"
        number_carriage = gets.to_i
        puts "Выберите тип вагона"
        puts "1. Пассажирский"
        puts "2. Грузовой"
        a = gets.to_i
        if a == 1
          @carriages << PassengerCarriage.new(@stations.each { |station| station if station.name == station_name }, number_carriage)
        elsif a == 2
          @carriages << CargoCarriage.new(@stations.each { |station| station if station.name == station_name }, number_carriage)
        end
      else
        puts "=========================================="
        puts "Выберите число, соответствующее списку!!!"
      end
    end
end
