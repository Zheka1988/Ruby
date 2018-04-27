class Carriage
  attr_reader :type, :station, :number
  def initialize(station, number, type)
    @station = station
    @number = number
    @type = type
  end
end
