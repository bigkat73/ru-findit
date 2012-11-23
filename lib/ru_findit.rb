module RuFindit

  extend ActiveSupport::Autoload

  autoload :Indexer
  autoload :Catalog
  autoload :Tokenizer
  autoload :Stopper
  autoload :Document

  module Model
    extend ActiveSupport::Autoload
    autoload :Searcher
    autoload :Index
  end
end
