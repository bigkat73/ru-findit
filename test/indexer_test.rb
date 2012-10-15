require 'test_helper'
require 'rubygems'
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
    @indexer.add_word("fred", document_id: "cats")
    assert_equal(true, @indexer.index.has_key?("fred"))
  end

  def test_add_one_word_to_index_count
    @indexer.add_word("fred", document_id: "cats")
    @indexer.add_word("mittens", document_id: "cats")
    assert_equal(1, @indexer.lookup("fred").fetch("cats").fetch(:term_frequency))
    assert_equal(1, @indexer.lookup("mittens").fetch("cats").fetch(:term_frequency))
  end

  def test_add_two_words_to_index_count
    @indexer.add_word("fred", document_id: "cats")
    @indexer.add_word("fred", document_id: "cats")
    assert_equal(2, @indexer.lookup("fred").fetch("cats").fetch(:term_frequency))
  end

  def test_add_one_word_from_two_documents
    @indexer.add_word("fred", document_id: "cats")
    @indexer.add_word("fred", document_id: "dogs")
    assert_equal(2, @indexer.lookup("fred").fetch(:total_frequency))
    assert_equal(1, @indexer.lookup("fred").fetch("cats").fetch(:term_frequency))
    assert_equal(1, @indexer.lookup("fred").fetch("dogs").fetch(:term_frequency))
  end

  def test_add_one_word_without_document_id
    @indexer.add_word("fred")
    assert_equal(1, @indexer.lookup("fred").fetch(:total_frequency))
  end

  def test_lookup_word_in_index
    @indexer.add_word("fred",document_id: "cats")
    assert_equal(true, @indexer.lookup("fred").class == Hash )
  end

  def test_remove_word_from_index_when_one_word_is_added_and_removed
    @indexer.add_word("fred", document_id: "cats")
    @indexer.remove_word("fred" ,document_id: "cats")

    assert_equal(true, @indexer.index.has_key?("fred"))
    assert_equal(0, @indexer.lookup("fred").fetch(:total_frequency))
    assert_equal(false, @indexer.lookup("fred").has_key?("cats"))
  end

  def test_remove_word_from_index_when_two_words_are_added_with_one_removed
    @indexer.add_word("fred", document_id: "cats")
    @indexer.add_word("fred", document_id: "cats")
    @indexer.remove_word("fred" ,document_id: "cats")

    assert_equal(true, @indexer.index.has_key?("fred"))
    assert_equal(1, @indexer.lookup("fred").fetch(:total_frequency))
    assert_equal(1, @indexer.lookup("fred").fetch("cats").fetch(:term_frequency))
    assert_equal(true, @indexer.lookup("fred").has_key?("cats"))
  end

  def test_add_stop_word_to_index
    @indexer.add_word("and", document_id: "cats")
    assert_equal(false, @indexer.index.has_key?("and"))
  end

  def test_search_for_word_score
    @indexer.add_word("fred", document_id: "cats")
    @indexer.add_word("fred", document_id: "cats")
    @indexer.add_word("fred", document_id: "dogs")

    assert_equal(2, @indexer.search("fred").size)
  end


end