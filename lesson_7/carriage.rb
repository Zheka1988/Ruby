require_relative 'manufacturer'
class Carriage
  include Manufacturer
  attr_reader :type, :number

  NUMBER_FORMAT = /^\d{4}$/

  def initialize(number, type)
    @array_type = ['p', 'c']
    @number = number
    @type = type
    validate!
  end

  def valid?
    validate!
    true
  rescue
    false
  end

  protected

  def validate!
    raise "Вагон может быть пассажирским 'p' или грузовым 'c'" if !@array_type.include?(type) #if type != 'p' && type != 'c' # по логике должно быть или ||
    raise "Номер вагона состоит из 4 цифр" if number.to_s !~ NUMBER_FORMAT
  end
end
