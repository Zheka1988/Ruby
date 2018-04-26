require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'route'
require_relative 'station'
require_relative 'vagon'
require_relative 'passenger_vagon'
require_relative 'cargo_vagon'
require_relative 'interfeis'


=begin
st1 = Station.new('a')
st2 = Station.new('b')
st3 = Station.new('c')
st4 = Station.new('d')
st5 = Station.new('f')

route = Route.new(st1,st5)
route = Route.new(st1,st5)
route.add_station(st2)
route.add_station(st3)
route.add_station(st4)

route.delete_station(st3)

p1 = PassengerTrain.new(100)
p2 = CargoTrain.new(102)

p1.routes(route)
vagon = PassengerCarriage.new(st1)
vagon2 = CargoCarriage.new(st2)


=end
fase = Interfeis.new

loop do
  puts "==================================================="
  puts "1. Создать станцию, поезд, маршрут или вагон"
  puts "2. Добавить/Удалить станцию в/из маршрут(а)"
  puts "3. Назначить маршрут поезду"
  puts "4. Прицепить/Отцепить вагон к/от поезду(а)"
  puts "5. Переместить поезд по маршруту"
  puts "6. Показать все станции"
  puts "7. Показать все поезда на станции"
  puts "8. Выход"
  a = gets.to_i
  case a
  when 1
    fase.create_object
  when 2
    puts "==================================================="
    puts "Введите название станции"
    name_station = gets.chomp
    puts "Введите номер маршрута"
    number_route = gets.chomp
    route = fase.routes.each { |route| route if route.number_route == number_route }
    puts "Что вы хотите сделать?"
    puts "1. Удалить"
    puts "2. Добавить"
    a = gets.to_i
    if a == 1
      route.delete_station(fase.stations.each { |station| station if station.name == name_station })
    else
      route.add_station(fase.stations.each { |station| station if station.name == name_station })
    end
  when 3
    puts "==================================================="
    puts "Введите номер маршрута"
    number_route = gets.chomp
    puts "Введите номер поезда"
    number_train = gets.chomp
    fase.trains.each { |train| train.routes(fase.routes.each { |route| route if route.number_route == number_route }) if train.number == number_train }
  when 4
    puts "==================================================="
    puts "Введите номер вагона"
    number_carriage = gets.chomp
    puts "Введите номер поезда"
    number_train = gets.chomp
    puts "Что вы хотите сделать?"
    puts "1. Прицепить вагон"
    puts "2. Отцепить вагон"
    a = gets.to_i
    if a == 1
      fase.trains.each do |train|
        train.add_carriage(fase.carriages.each{ |carriage| carriage if carriage.number == number_carriage }) if train.number == number_train
      end
    elsif a == 2
      fase.trains.each do |train|
        train.remove_carriage(fase.carriages.each{ |carriage| carriage if carriage.number == number_carriage }) if train.number == number_train
      end
    end
  when 5
    puts "==================================================="
    puts "Введите номер поезда"
    number_train = gets.chomp
    puts "Куда вы хотите переместить?"
    puts "1. --->"
    puts "2. <---"
    a = gets.to_i
    if a == 1
      fase.trains.each do |train|
        train.go_next_station if train.number == number_train
      end
    elsif a == 2
      fase.trains.each do |train|
        train.go_past_station if train.number == number_train
      end
    end
  when 6
    puts "==================================================="
    fase.stations.each.with_index(1) { |station, index| puts "Станция № #{index} - #{station.name}" }
  when 7
    puts "==================================================="
    puts "Введите название станции"
    name_station = gets.chomp
    safe.stations.each { |station| puts "#{station.trains}" if station.name == name_station }
  when 8
    exit
  else
    puts "==================================================="
    puts "Выберите число, соответствующее списку!!!"
  end
end


#---------------------------------------------------------------------------






