require 'rails'
require 'positioned'

module Positioned
  if defined? Rails::Railtie

    class Railtie < Rails::Railtie
      
      initializer 'positioned.insert_into_active_record' do
        ActiveSupport.on_load(:active_record) do
          Positioned::Railtie.insert
        end
      end
    end
  end
  
  class Railtie
    def self.insert
      ActiveRecord::Base.send(:include, Positioned::Glue)
    end
  end
end