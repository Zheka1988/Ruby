class CargoTrain < Train
  def initialize(number, type = 'C')
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
