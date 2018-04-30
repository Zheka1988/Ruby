require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'route'
require_relative 'station'
require_relative 'carriage'
require_relative 'passenger_carriage'
require_relative 'cargo_carriage'
require_relative 'interface'
require_relative 'main_interface'

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
face = Interface.new
main_interface = MainInterface.new(face)
main_interface.start



#---------------------------------------------------------------------------






