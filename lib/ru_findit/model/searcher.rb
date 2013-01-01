module RuFindit
  module Model
    module Searcher

      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods

        attr_reader :index
        delegate :search, to: :index

        def index_all!
          self.class.index.index_all(self.all)
        end

        def indexable(*args, &block)
          @index = Index.new &block
        end

      end

      def index!
        self.class.index.index_instance(self)
      end

    end
  end
end