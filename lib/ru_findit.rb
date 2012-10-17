module RuFindit
  # your code goes here
  extend ActiveSupport::Autoload

  autoload :Indexer
  autoload :IndexCatalog
  autoload :Tokenizer
  autoload :Stopper

  module Model
    extend ActiveSupport::Autoload
    autoload :Indexer
  end
end
