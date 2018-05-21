class MainInterface

  def initialize(face)
    @face = face
  end

  def start
    loop do
      puts "==================================================="
      puts "1. Создать станцию, поезд, маршрут или вагон"
      puts "2. Добавить/Удалить станцию в/из маршрут(а)"
      puts "3. Назначить маршрут поезду"
      puts "4. Прицепить/Отцепить вагон к/от поезду(а)"
      puts "5. Переместить поезд по маршруту"
      puts "6. Показать все станции"
      puts "7. Показать все поезда на станции(из прошлых уроков)"
      puts "8. Все поезда (блок)"
      puts "9. Все вагоны поезда (блок)"
      puts "10. Занять место или объем в вагоне"
      puts "11. Выход"
      a = gets.to_i
      case a
      when 1                         #Создать станцию, поезд, маршрут или вагон
        @face.create_object
      when 2                         #Добавить/Удалить станцию в/из маршрут(а)
        puts "==================================================="
        puts "Введите название станции"
        name_station = gets.chomp
        puts "Введите номер маршрута"
        number_route = gets.to_i
        if @face.station_exist?(name_station) && @face.route_exist?(number_route)
          begin
            puts "Что вы хотите сделать?"
            puts "1. Удалить"
            puts "2. Добавить"
            a = gets.to_i
          end until a ==1 || a ==2
          if a == 1
            @face.del_station(number_route, name_station)
          else
            @face.add_station(number_route, name_station)
          end
        else
          puts "Убедитесь в существованиии станции и маршрута!"
        end
      when 3                         #Назначить маршрут поезду
        puts "==================================================="
        puts "Введите номер маршрута"
        number_route = gets.chomp
        puts "Введите номер поезда"
        number_train = gets.chomp
        if @face.train_exist?(number_train) && @face.route_exist?(number_route)
           @face.trains.each do |train|
            train.routes(@face.routes.find { |route| route.number_route == number_route }) if train.number == number_train
          end
          @face.trains.each {|train| puts "Поезду присвоен маршрут #{train.route.number_route}" if train.number == number_train}
        else
          puts "Убедитесь в существовании поезда и маршрута!"
        end
      when 4                         #Прицепить/Отцепить вагон к/от поезду(а)"
        puts "==================================================="
        puts "Введите номер вагона"
        number_carriage = gets.chomp
        puts "Введите номер поезда"
        number_train = gets.chomp
        if @face.carriage_exist?(number_carriage) && @face.train_exist?(number_train) #&& face.stations_equal?(number_carriage, number_train)
          begin
          puts "Что вы хотите сделать?"
          puts "1. Прицепить вагон"
          puts "2. Отцепить вагон"
          a = gets.to_i
          end until a ==1 || a == 2
          if a == 1
            @face.trains.each do |train|
              train.add_carriage(@face.carriages.find{ |carriage| carriage.number == number_carriage }) if train.number == number_train
            end
          else
            @face.trains.each do |train|
              train.remove_carriage(@face.carriages.find{ |carriage| carriage.number == number_carriage }) if train.number == number_train
            end
          end
        else
          puts "Убедитесь в существовании вагона и поезда" #, а также они должны стоять на одной станции"
        end
      when 5                         #Переместить поезд по маршруту
        puts "==================================================="
        puts "Введите номер поезда"
        number_train = gets
        if @face.train_exist?(number_train)
          begin
            puts "Куда вы хотите переместить?"
            puts "1. --->"
            puts "2. <---"
            a = gets.to_i
          end until a == 1 || a == 2
          if a == 1
            @face.trains.each { |train| train.go_next_station if train.number == number_train }
          else
            @face.trains.each { |train| train.go_past_station if train.number == number_train }
          end
        else
          puts "Поезда с таким номером не существует!"
        end
      when 6                         #Показать все станции"
        puts "==================================================="
        puts "Маршрут содержит станции: "
        @face.stations.each.with_index(1) { |station, index| puts "Станция № #{index} - #{station.name}" }
      when 7                         #Показать все поезда на станции(из старого задания)"
        puts "==================================================="
        puts "Введите название станции"
        name_station = gets.chomp
        if @face.station_exist?(name_station)
          puts "На станции \"#{name_station}\" находятся поезда:"
          @face.stations.each { |station| station.trains.each.with_index(1) { |train, index| puts "#{index}. Поезд - №#{train.number}"} if station.name == name_station }
        else
          puts "Такой станции не существует"
        end
      when 8
        puts "Введите название станции"
        name_station = gets.chomp
        if @face.station_exist?(name_station)
          @face.stations.each do |station|
            station.all_trains { |train| puts "Поезд № #{train.number}, тип = #{train.type}, количество вагонов #{train.carriages.length}" } if station.name == name_station
          end
        else
          puts "Такой станции не существует!"
        end
      when 9
        puts "Введите номер поезда"
        number_train = gets.chomp
        if @face.train_exist?(number_train)
          @face.trains.each do |train|
              train.all_carriages { |carriage, index| print_info_carriage(carriage, index) } if train.number == number_train
          end
        end
      when 10 #-----------------------------------------------------------------------------------------------
        begin
        puts "Грузовой (c) или пассажирский (p)?"
        type = gets.chomp
        end until  type != 'c' || type != 'p'
        if type == 'c'
          puts "Выберите номер поезда"
          @face.trains.each { |train| puts "Номер поезда - #{train.number}" if train.type == 'c' }
        else
          puts "Выберите поезд по номеру"
          @face.trains.each { |train| puts "Номер поезда - #{train.number}" if train.type == 'p' }
        end
        #---------v method
        number_train = gets.chomp
        puts "Выбрать вагон"
        @face.trains.each do |train|
          train.carriages.each { |carriage| puts "Номер вагона - #{carriage.number}"} if train.number == number_train
        end
        number_carriage = gets.chomp
        puts "Какой объем занять?"

        @face.carriages.each do |carriage|
          carriage.load_into_carriage() if carriage.number == number_carriage
        end
        #-------------------------------------------
      when 11
        exit
      else
        puts "==================================================="
        puts "Выберите число, соответствующее списку!!!"
      end
    end
  end

  def print_info_carriage(carriage, index)
    if carriage.type == 'c'
      puts "#{index}. Номер вагона #{carriage.number}, тип = #{carriage.type}, занято #{carriage.occupied_volume}, свободно #{carriage.free_volume}"
    else
      puts "#{index}. Номер вагона #{carriage.number}, тип = #{carriage.type}, занято #{carriage.occupied_seats}, свободно #{carriage.free_seats}"
    end
  end
end
