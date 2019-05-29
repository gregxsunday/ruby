require 'minitest/autorun'
load 'zad1.rb'

# Tests
class TestWords < MiniTest::Test
  def setup
    @result1 = word_lenghts("qq ffaf\n1 1")
    @result2 = how_often_certain_length("qq ffaf\n1 1", 1)
    @result3 = how_often_certain_length("qq ffaf\n1 1", 2)
    @result4 = how_often_certain_length("qq ffaf\n1 1", 4)
  end

  def test_word_lenghts
    assert_equal(@result1, SortedSet.new([1, 2, 4]))
  end

  def test_how_often_word
    assert_equal(@result2, 2)
    assert_equal(@result3, 1)
    assert_equal(@result4, 1)
  end

end