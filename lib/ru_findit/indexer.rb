require_relative  'stopper'

module RuFindit

  class Indexer

    attr_accessor :index

    def initialize(document_id=nil)
      @document_id = document_id || 'none'
      @index = {}
      @stopper = Stopper.new
    end

    def add_word(word, index_in_document)
      index[word] = { @document_id => index_in_document } unless @stopper.matches(word)
    end

    def remove_word(word)
      if index.has_key?(word)
        index[word].delete(@document_id)
      end
    end

    def lookup(word)
      index[word]
    end

  end
end