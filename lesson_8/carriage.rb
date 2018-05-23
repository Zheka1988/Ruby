require_relative 'manufacturer'
require_relative 'valid'
class Carriage
  include Manufacturer
  include Valid
  attr_reader :type, :number, :capacity, :occupied_capacity

  NUMBER_FORMAT = /^\d{4}$/

  def initialize(number, type, capacity)
    @capacity = capacity
    @occupied_capacity = 0
    @array_type = ['p', 'c']
    @number = number
    @type = type
    validate!
  end

  def take_capacity(num)
    @occupied_capacity += num
    @capacity -= num
  end

  def get_free_capacity
    capacity
  end

  protected

  def validate!
    raise "Вагон может быть пассажирским 'p' или грузовым 'c'" if !@array_type.include?(type)
    raise "Номер вагона состоит из 4 цифр" if number.to_s !~ NUMBER_FORMAT
  end
end
