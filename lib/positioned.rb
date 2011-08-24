require "positioned/railtie"

# Positioned
module Positioned #:nodoc:
    
  module Glue
    def self.included base
      base.class_eval do
        extend ClassMethods
      end
    end
  end
  
  module ClassMethods
    def positioned(options = {})
      options = {:position_column => 'position', :scope_conditions => nil}.update(options)
      
      @position_column  = options[:position_column]
      
      # position scope is to limit the position to certain conditions
      @position_scope   = options[:scope_conditions]  
      include InstanceMethods
                
      before_create :set_position
    end
    
    def position_column
      @position_column || nil
    end
    def position_scope
      @position_scope || nil
    end
    
    def sorted
      order("#{self.position_column}")
    end
  end
  
  module InstanceMethods
    
    
    def position_column
      self.class.position_column
    end
    
    def set_position
      self[self.position_column] = self.class.maximum(:position, :conditions => (self.class.position_scope.blank? ? nil : eval(self.class.position_scope))).to_i + 1
    end
    
  end
  
end