module Athena
  module Persistence
    def self.included(base)
      base.class_eval do
        @@persistence_class = nil
      end
    end

    def persist(klass, &block)
      pklass = Class.new(klass)

      pklass.class_eval(&block)
      pklass.class_eval "set_table_name '#{self.name}'.tableize"
      eval "Persistent#{self.name} = pklass"
      
      @@persistence_class = pklass
      @@persistence_class.establish_connection(
        YAML::load(IO.read(File.join(Athena::Application.root, 'config', 'database.yml')))
      )
    end
    
    def new_record(*args)
      self.persistence_class.new(*args)
    end
    
    def persistence_class
      @@persistence_class
    end
        
    def method_missing(name, *args)
      return self.persistence_class.send(name, *args)
    rescue ActiveRecord::ActiveRecordError => e
      raise e
    rescue
      super
    end
  end
end