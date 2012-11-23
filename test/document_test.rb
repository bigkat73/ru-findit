require 'minitest/spec'
require 'minitest/autorun'

require_relative '../lib/ru_findit/document'

describe Document do

	before :each do
		@doc = Document.new("Hi. This is a document. \n  It should be parsed into an array.\n")
	end

	it "should contain an id" do
		@doc.must_respond_to(:id)
	end

	it "should contain a body" do
		@doc.must_respond_to(:body)
		@doc.body.must_equal("Hi. This is a document. \n  It should be parsed into an array.\n")
	end

  it "should persist its tokens" do
  	@doc.tokens.must_equal(["hi", "this", "is", "a", "document", "it", "should", "be", "parsed", "into", "an", "array"])
	end

	it "should contain know how many words are in its body" do
		@doc.word_count.must_equal(12)
	end

end