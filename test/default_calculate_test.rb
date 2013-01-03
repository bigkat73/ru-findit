require 'minitest/spec'
require 'minitest/autorun'

require_relative '../lib/ru_findit/default_calculator'

describe DefaultCalculator do

  describe '0 documents' do
  	it "should calculate the tf_idf score" do
      DefaultCalculator.calculate('','','','').must_equal({:document_id => nil, :scores => 0})
    end
  end

end