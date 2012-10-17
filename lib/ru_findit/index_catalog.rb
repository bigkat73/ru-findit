module RuFindit
  class IndexCatalog

    attr_accessor :documents, :indexer

    def initialize(indexer)
      @indexer = indexer
    end

    def load_documents(documents)
      @documents = documents
      if @documents.class == Hash
        @documents.each do |document_id, document_body|
          t = RuFindit::Tokenizer.new(document_body)
          t.tokenize
          t.tokens.each do |toke|
            @indexer.add_word(toke, document_id: document_id)
          end
        end
      elsif @document.class == Array
        @documents.each_with_index do |document, document_id|
          t = RuFindit::Tokenizer.new(document)
          t.tokenize
          t.tokens.each do |toke|
            @indexer.add_word(toke, document_id: document_id)
          end
        end
      end
      @documents.size
    end

    def search(word)
      @indexer.search(word)
    end

  end
end