require "test/unit"
require_relative  '../lib/ru_findit/stopper'

class StopWordTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    # Do nothing
    @s = RuFindit::Stopper.new
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

  # Fake test
  def test_matching_stop_word
    assert_equal(true, @s.matches("and") )
  end

  def test_non_matching_stop_word
    assert_equal(false, @s.matches("fred") )
  end

end