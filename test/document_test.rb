require 'minitest/spec'
require 'minitest/autorun'
require 'pry'

require_relative '../lib/ru_findit/document'

describe Document do

	before :each do
		@doc = Document.new
	end

	it "should contain an id" do
		@doc.must_respond_to(:id)
	end

	it "should contain a body" do
		@doc.must_respond_to(:body)
	end

	it "should contain know how many words are in its body" do

	end

end