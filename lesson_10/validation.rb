module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send:include, InstanceMethods
  end
  module ClassMethods
    def validate (name, type_valid, addition_value = nil)
      if type_valid == :presence
        raise "Значение, не может быть nil!" if name == nil || name == ''
      elsif type_valid == :type
        raise "Не соответствуют типы!" if addition_value == nil || name.class.to_s != addition_value
      elsif type_valid == :format
        raise "Значение не соответствует формату!" if addition_value == nil || !name.to_s[eval(addition_value)]
      end
    end
  end
  module InstanceMethods
    def validate!(name)
      self.class.validate name, :presence
      puts "Введите тип переменной:"
      str = gets.chomp
      self.class.validate name, :type, str
      puts "Введите регулярное выражение:"
      regexp  = gets.chomp
      self.class.validate name, :format, regexp
      true
    rescue RuntimeError => e
      e.message
      false
    end

    def valid?(name)
      validate!(name) ? true : false
    end
  end
end

class Test
  extend Accessors
  include Validation
  attr_accessor_wih_history :a, :b, :c
  strong_attr_accessor :attr, String
end
