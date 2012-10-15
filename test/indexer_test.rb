require "test/unit"
require_relative  '../lib/ru_findit/stopper'
require_relative  '../lib/ru_findit/indexer'

class IndexerTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    # Do nothing
    @indexer = RuFindit::Indexer.new
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

  def test_add_word_to_index
    @indexer.add_word("fred", "10")
    assert_equal(true, @indexer.index.has_key?("fred"))
  end

  def test_lookup_word_in_index
    @indexer.add_word("fred", "10")
    assert_equal(true, @indexer.lookup("fred").class == Hash )
  end

  def test_remove_word_from_index
    @indexer.add_word("fred", "10")
    @indexer.remove_word("fred")
    assert_equal(true, @indexer.index.has_key?("fred"))
    assert_equal(true, @indexer.lookup("fred").empty?)
  end

  def test_add_stop_word_to_index
    @indexer.add_word("and", "11")
    assert_equal(false, @indexer.index.has_key?("and"))
  end

end