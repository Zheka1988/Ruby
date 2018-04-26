class Carriage
  attr_reader :type, :station, :number
  def initialize(station, number)
    @station = station
    @number = number
  end
end
