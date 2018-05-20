require_relative 'instance_counter'
class Route
  include InstanceCounter
  attr_reader :stations, :number_route, :first_station, :finish_station

  NUMBER_FORMAT = /^\d{4}$/

  def initialize(first_station, finish_station, number)
    @stations = [first_station, finish_station]
    @number_route = number
    validate!
    register_instance!
  end

  def add_station(station) # можно было воспользоваться методом valid, но тогда надо было передать ее аргументом или сначала записать станцию в массив, а далее если не подходит то удалить, мне показалось так проще, не смотря на маленькое дублирование)
    raise "Нет существует такой станции или она уже включена в маршрут!" if station.class != Station || @stations.find { |stat| stat.name == station.name}
    raise "Данная станция включена в маршрут" if @stations.find { |stat| stat == station }
    @stations.insert(-2, station)
  rescue Exception => e
    puts e.message
  ensure
    show_stations
  end

  def delete_station(station)
    if station != @stations[0] && station != @stations[-1]
      @stations.delete(station)
      show_stations
    else
      puts "Эта станция не может быть удалена!"
    end
  end

  def show_stations
    @stations.each.with_index(1) { |station, index| puts  "Station number #{index} - #{station.name}" }
  end

  def change_number_route(number)
    spare_number = @number_route
    @number_route = number
    if valid?
      puts "Номер изменен на #{number}"
    else
      @number_route = spare_number
    end
  end

  def valid?
    validate!
    true
  rescue Exception => e
    puts e.message
    false
  end

  protected

  def validate!
   # @stations.each {|station| raise "Нет такой(их) станций" if station.class != Station } проверка на наличие станций уже есть в интерфейсе, метод station_exist?)))
    raise "Станции не могут быть одинаковыми" if @stations[0] == @stations[1]
    raise "Номер маршрута состоит из 4 цифр" if number_route.to_s !~ NUMBER_FORMAT
  end

end
