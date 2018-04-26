class PassengerCarriage < Carriage
  def initialize(station,number)
    super
    @type = 'P'
  end
end
