module InstanceCounter
=begin
  def self.included(base)
    base.extend ClassMethods
    base.send:include, InstanceMethods
  end
=end
  $count = 0
  module ClassMethods
    def instances
     #puts "#{$count}"
      $count
    end
  end

  module InstanceMethods
    protected
    def register_instance
      $count += 1
    end
  end
end
