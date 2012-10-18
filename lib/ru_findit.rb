module RuFindit
  # your code goes here
  extend ActiveSupport::Autoload

  autoload :Indexer
  autoload :Catalog
  autoload :Tokenizer
  autoload :Stopper

  module Model
    extend ActiveSupport::Autoload
    autoload :Searcher
    autoload :Index
  end
end
