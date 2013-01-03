class DefaultCalculator

  def self.calculate(num_docs, documents_word_freq, word_indexes, document_word_count)
	if num_docs == ''
	# idf = 1.0 * num_docs / documents_word_freq
	# scores = word_indexes.map do |k,v| 
	#   {document_id: k, score: ( (v[:term_frequency]/document_word_count[k]) * idf) }
	# end

	# scores.sort{|a,b| b[:score] <=> a[:score]}
    	{document_id: nil, scores: 0}
    else
      ""
    end
  end

end