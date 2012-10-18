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
          self.all.each(&:index!)
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