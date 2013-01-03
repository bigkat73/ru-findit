require 'pry'
require 'pry-nav'
class DefaultCalculator

  def self.calculate(num_docs, documents_word_freq, word_indexes, document_word_count)
    scores = if num_docs == '' && documents_word_freq.empty? && 
       word_indexes.empty? && document_word_count.empty?
    	[{document_id: nil, score: 0}]
    else
      idf = 1.0 * num_docs / documents_word_freq
      word_indexes.map do |k,v| 
        {document_id: k, score: ( (v[:term_frequency]/document_word_count[k]) * idf) }
      end
    end
    scores.sort{|a,b| b[:score] <=> a[:score]}
  end

end