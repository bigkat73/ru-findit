require 'test/unit'
require_relative  '../lib/ru_findit/tokenizer'

class TokenizerTest < Test::Unit::TestCase

  def test_tokenize
    document = "Hi. This is a document. \n  It should be parsed into an array.\n"
	  t = RuFindit::Tokenizer.new(document)
	  t.tokenize

	  assert_equal(t.tokens,
	      ["hi", "this", "is", "a", "document", "it", "should", "be", "parsed", "into", "an", "array"] )
  end

end