require 'minitest/autorun'
load 'main.rb'

# Tests
class TestSum < MiniTest::Test
  def setup
    @result1 = sum(2, 2)
    @result2 = sum(2, 1.5)
    @result3 = sum(2, '2')
    @result4 = sum('2.1', '2.0')
    @result5 = sum('2/3', '1/6')
    @result6 = sum('3-5i', '2+4i')
  end

  def test_sum_integer_integer
    assert_equal(@result1, 4)
  end

  def test_sum_integer_float
    assert_equal(@result2, 3.5)
  end

  def test_sum_integer_string
     assert_equal(@result3, 4)
  end

  def test_sum_string_string
     assert_equal(@result4, 4.1)
  end

  def test_sum_rational
    assert_equal(@result5, '5/6'.to_r)
  end

  def test_sum_complex
    assert_equal(@result6, '5-1i'.to_c)
  end

  def test_sum_integer_wrong_number_in_string
     assert_raises ArgumentError do
       sum(2, 'Ala ma kota123')
     end
  end
end