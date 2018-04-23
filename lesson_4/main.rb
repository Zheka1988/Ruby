require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'route'
require_relative 'station'
require_relative 'vagon'
require_relative 'passenger_vagon'
require_relative 'cargo_vagon'



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

vagon = PassengerVagon.new(st1)
vagon2 = CargoVagon.new(st2)

p1.add_vagon(vagon)
p1.remove_vagon(vagon)

p1.go_next_station
p1.go_past_station

route.show_stations
st1.trains
#---------------------------------------------------------------------------
