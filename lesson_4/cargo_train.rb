class CargoTrain < Train
  def initialize(number)
    super
    type
  end

  private
  def type #нельзя изменить тип вагона, если только добавить метод переделать вагон))
    @type = 'C'
  end
end
