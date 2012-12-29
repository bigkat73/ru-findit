module RuFindit
  class Catalog

    attr_accessor :documents, :indexer

    def initialize(indexer)
      @indexer = indexer
    end

    def load_documents(documents)
      @documents = documents

      # handle AR collection where the document has an id and a body
      # or an array of documents using the id as the array id
      @documents.each_with_index do |document, document_id|
        doc = if ( document.respond_to?(:id) && document.respond_to?(:body) )
          document
        else
          Document.new(document, document_id)
        end
        add_tokens_to_index_from(doc)
      end

      @documents.size
    end

    def search(word)
      @indexer.search(word)
    end

    private

    def add_tokens_to_index_from(document)
      document.tokens.each do |toke|
        @indexer.add_word(toke, document_id: document.id)
      end
    end

  end
end