class Index

  attr_reader :indexable_fields, :current_index

  def initialize(&block)
    @indexable_fields = Set.new
    @current_index = {}
    instance_eval &block if block_given?
  end

  def indexes(*model_fields)
    @indexable_fields += model_fields.flatten
  end

  def index_instance(instance)
    indexable_attributes = instance.attributes.select { |k,v| @indexable_fields.include?(k) }
    @current_index[instance.id] = indexable_attributes.values.join(' ')
  end

end

module RuFindit
  module Model
    module Indexer

      def self.included(base)
        base.extend ClassMethods
      end

      def index!
        self.class.index.index_instance(self)
      end

      module ClassMethods

        attr_reader :index

        def index_all!
          self.all.each(&:index!)
        end

        def indexable(*args, &block)
          @index = Index.new self, &block
        end

      end

    end
  end
end