module RuFindit
  class Catalog

    attr_accessor :documents, :indexer

    def initialize(indexer)
      @indexer = indexer
    end

    def load_documents(documents)
      @documents = documents
      if @documents.class == Hash
        @documents.each do |document_id, document_body|
          add_tokens_to_index(document_id, document_body)
        end
      elsif @documents.class == Array
        @documents.each_with_index do |document_body, document_id|
          add_tokens_to_index(document_id, document_body)
        end
      end
      @documents.size
    end

    def search(word)
      @indexer.search(word)
    end

    private

    def add_tokens_to_index(document_id, document_body)
      t = RuFindit::Tokenizer.new(document_body)
      t.tokenize
      t.tokens.each do |toke|
        @indexer.add_word(toke, document_id: document_id)
      end
    end

  end
end