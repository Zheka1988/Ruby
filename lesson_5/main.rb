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
#require_relative 'company'

face = Interface.new
main_interface = MainInterface.new(face)
main_interface.start
