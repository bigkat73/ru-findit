require_relative 'tokenizer'

module RuFindit
  class IndexCatalog

    attr_accessor :documents, :indexer

    def initialize(indexer)
      @indexer = indexer
    end

    def load_documents(documents)
      if documents.class == Array
        @documents = documents
      end
      @documents.each_with_index do |document, document_id|
        t = RuFindit::Tokenizer.new(document)
        t.tokenize
        t.tokens.each do |toke|
          @indexer.add_word(toke, document_id: document_id)
        end
      end
      @documents.size
    end

    def search(word)
      @indexer.search(word)
    end

  end
end