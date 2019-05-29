require 'minitest/autorun'
load 'zad2.rb'

# Tests
class TestRegex < MiniTest::Test
  def setup
    @result1 = print_only_word("Ala")
    @result2 = print_only_word("1kota")
    @result3 = print_only_word("psów20")
    @result4 = print_only_word("50")
    @result5 = print_only_number("Ala")
    @result6 = print_only_number("1kota")
    @result7 = print_only_number("psów20")
    @result8 = print_only_number("50")
  end

  def test_word_word
    assert_equal(@result1[0], "Ala")
  end

  def test_word_number_word
    assert_equal(@result2[0], "kota")
  end

  def test_word_word_number
    assert_equal(@result3[0], "psów")
  end

  def test_word_number
    assert_nil(@result4)
  end

  def test_number_word
    assert_nil(@result5)
  end

  def test_number_number_word
    assert_equal(@result6[0], "1")
  end

  def test_number_word_number
    assert_equal(@result7[0], "20")
  end

  def test_number_number
    assert_equal(@result8[0], "50")
  end

end