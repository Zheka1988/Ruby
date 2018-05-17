require_relative 'manufacturer'
class Carriage
  include Manufacturer
  attr_reader :type, :number

  NUMBER_FORMAT = /^\d{4}$/

  def initialize(number, type)
    @number = number
    @type = type
    validate!
  end

  #def valid?  этот метод думаю не нужен т.к. нет сеттеров
  # if validate!
  #    true
  #  else
  #    false
  #  end
  #end

  protected

  def validate!
    raise "Вагон может быть пассажирским 'p' или грузовым 'c'" if type !='p' && type !='c' # по логике должно быть или ||
    raise "Номер вагона состоит из 4 цифр" if number.to_s !~ NUMBER_FORMAT
    true
  end
end
