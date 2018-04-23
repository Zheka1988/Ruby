class PassengerTrain < Train
  def initialize(number)
    super
    type
  end

  def type
    @type = 'P'
  end
end
