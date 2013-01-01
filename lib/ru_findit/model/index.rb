module RuFindit
  module Model
    class Index

      attr_reader :current_index, :indexer

      def initialize(&block)
        @indexable_fields = Set.new
        @current_index = {}
        @catalog = RuFindit::Catalog.new(RuFindit::Indexer.new)
        instance_eval &block if block_given?
      end

      def indexes(*model_fields)
        @indexable_fields += model_fields.flatten
      end

      def index_all(instances)
        @catalog.load_documents(instances)
      end

      def index_instance(instance)
        indexable_attributes = instance.attributes.select { |k,v| @indexable_fields.include?(k.to_sym) }
        cur_index = { instance.id => indexable_attributes.values.join(' ') }
        @catalog.load_documents(cur_index)
        @current_index.merge!(cur_index)
      end

      def search(word)
        @catalog.search(word)
      end

    end
  end
end