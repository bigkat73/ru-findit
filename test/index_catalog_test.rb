require "test/unit"

require_relative '../lib/ru_findit/index_catalog'
require_relative '../lib/ru_findit/indexer'

class IndexCatalogTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    indexer = RuFindit::Indexer.new
    @index_catalog = RuFindit::IndexCatalog.new(indexer)
    @documents = [
      "This is a test.\n  About Snacks.\n I like cheese and crackers.  Sometimes hot chocolate.",
      "Another test.\n  About pets and cats.\n Darn cats picks on dog.  Dog fights back.  The rat also \n kills the cats.",
      "Last Test.\n  The cats in the hat went splat after eating some cheese and crackers.\n"
    ]
    @loaded = @index_catalog.load_documents(@documents)
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

  def test_load_array_documents
    assert_equal(3, @loaded)
  end

  def test_lookup_word_returns_array
    assert_equal(Array, @index_catalog.search("snacks").class)
  end

  def test_scoring_of_word_lookup
    scores = @index_catalog.search("cats")
    assert_equal(true, scores[0].fetch(:score) > scores[1].fetch(:score))
  end

end