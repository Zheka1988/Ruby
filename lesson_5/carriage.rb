require_relative 'company'
class Carriage
  include Company
  attr_reader :type, :number
  def initialize(number, type)
    @number = number
    @type = type
  end
end
