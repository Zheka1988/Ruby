class CargoTrain < Train
  def initialize(number, type = 'C')
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
