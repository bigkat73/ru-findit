require_relative  'stopper'

module RuFindit

  class Indexer

    attr_accessor :index

    def initialize(document_id=nil)
      @document_id = document_id || 'none'
      @index = {}
      @stopper = Stopper.new
    end

    def add_word(word)
      unless @stopper.matches(word)
        index[word] = {total_frequency: 0} unless index.has_key?(word)
        index[word][:total_frequency] += 1
        index[word][@document_id] = {term_frequency: 0} unless index[word].has_key?(@document_id)
        index[word][@document_id][:term_frequency] += 1
      end
    end

    def remove_word(word)
      if index.has_key?(word)
        index[word][:total_frequency] -= 1
        index[word].delete(@document_id)
      end
    end

    def lookup(word)
      index[word]
    end

  end
end
