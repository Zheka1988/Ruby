module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send:include, InstanceMethods
  end

  module ClassMethods
    define_method("validate") do |name, type_valid, addition_value = nil|
      if type_valid == :presence
        raise "Значение, не может быть nil!" if name == nil || name == ''
      elsif type_valid == :type
        raise "Не соответствуют типы!" if addition_value == nil || !(name.is_a? addition_value)
      elsif type_valid == :format
        raise "Значение не соответствует формату!" if addition_value == nil || name !~ addition_value
      end
    end
  end

  module InstanceMethods
    def validate!
      self.class.validate @name, :presence
      self.class.validate @name, :type, String
      self.class.validate @name, :format, self.class::NAME
    end

    def valid?
      validate!
      true
    rescue StandardError => e
      puts e.message
      false
    end
  end
end

