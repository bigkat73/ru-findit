module RuFindit
  module Model
    module Search

      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods
        def search(arg)
          @indexer.search(arg)
        end
      end
    end
  end
end