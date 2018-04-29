class Carriage
  attr_reader :type, :number #,:station
  def initialize(number, type) #,station
#    @station = station
#    @station.carriage_added(self)
    @number = number
    @type = type
  end
end
