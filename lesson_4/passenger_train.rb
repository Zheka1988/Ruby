class PassengerTrain < Train
  def initialize(number, type = 'P')
    super
  end

  def add_carriage(carriage)
    if carriage.type == self.type
      super
    else
      puts "Не совпадают типы вагонов"
    end
  end
end
