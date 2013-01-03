require 'minitest/spec'
require 'minitest/autorun'

require_relative '../lib/ru_findit/default_calculator'

describe DefaultCalculator do

  describe '0 documents' do
  	it "should calculate the tf_idf score" do
      DefaultCalculator.calculate('','','','').must_equal([{:document_id => nil, :score => 0}])
    end
  end

  describe '2 documents' do

    before do
      indexer = RuFindit::Indexer.new
      @index_catalog = RuFindit::Catalog.new(indexer)
      @documents = ["This is a big test.","Another test."]
      @loaded = @index_catalog.load_documents(@documents)
      # num_docs, documents_word_freq, word_indexes, document_word_count
      @word_indexes = { 0 => {:term_frequency => 1.0}, 1 => {:term_frequency => 1.0} }
      @document_word_count = {0 => 3, 1 => 2}
    end

    it "should calculate the tf_idf score for word test" do
      ## TODO pass in less...this is pretty wordy yet
      DefaultCalculator.calculate(@documents.size,2, @word_indexes, @document_word_count).must_equal([{:document_id => 1, :score => (1/2.0)},{:document_id => 0, :score => (1/3.0)}])
    end
  end


end