class CargoCarriage < Carriage
  def initialize(station, number)
    super
    @type = 'C'
  end
end
