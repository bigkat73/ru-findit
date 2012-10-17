module RuFindit
  module Model
    module Search

      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods

        def search(*args)
          query,options = args.shift
          $indexer = $indexer || RuFindit::IndexCatalog.new(RuFindit::Indexer.new)

        end

      end
    end
  end
end