class PassengerTrain < Train
  def initialize(number, type = 'P')
    super
  end

  def add_carriage(carriage)
    if carriage.type == self.type
      super
    else
      puts "У поезда и вагона разные типы"
    end
  end


  def remove_carriage(carriage)
    if carriage.type == self.type
      super
    else
      puts "У поезда и вагона разные типы"
    end
  end

end
