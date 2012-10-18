module RuFindit

  class Indexer

    attr_accessor :index, :document_word_count

    def initialize(document_id=nil)
      @document_id = document_id || 'none'
      @index = {}
      @document_word_count = {}
      @stopper = Stopper.new
    end

    def add_word(word, params={})
      document_id = params[:document_id] || 'none'
      unless @stopper.matches(word)
        index[word] = {total_frequency: 0} unless index.has_key?(word)
        index[word][:total_frequency] += 1
        index[word][document_id] = {term_frequency: 0} unless index[word].has_key?(document_id)
        index[word][document_id][:term_frequency] += 1
        document_word_count[document_id] = 0 unless index.has_key?(document_id)
        document_word_count[document_id] += 1
      end
    end

    def remove_word(word, params={})
      document_id = params[:document_id] || 'none'
      if index.has_key?(word)
        index[word][:total_frequency] -= 1
        index[word][document_id][:term_frequency] -= 1
        index[word].delete(document_id) if index[word][document_id][:term_frequency] == 0
        ## if word exists
        document_word_count[document_id] -= 1
      end
    end

    def lookup(word)
      index.fetch word do
        {
          total_frequency: 0,
          "none" => {
            term_frequency: 0
          }
        }
      end
    end

    def search(word)
      word_indexes = lookup(word).clone
      binding.pry
      documents_word_freq = word_indexes.delete(:total_frequency)
      num_docs = word_indexes.keys.size
      idf = 1.0 * num_docs / documents_word_freq

      scores = word_indexes.map{|k,v| {document_id: k, score: ( (v[:term_frequency]/document_word_count[k]) * idf) }}
      scores.sort{|a,b| b[:score] <=> a[:score]}
    end

  end
end
