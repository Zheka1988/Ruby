module InstanceCounter

  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end
  #attr_reader :counter
  @@counter = 0

  module ClassMethods
    def instances
      puts "instances HI"
      #InstanceCounter::@@counter
    end
  end

  module InstanceMethods
    protected
    def register_instance
      puts "register_instance"
      1
    end
  end




end
