require 'minitest/autorun'
load 'skrypt.rb'

# Tests
class TestBank < MiniTest::Test
  def setup
    @result1 = whose_account('--stan')
    @result2 = whose_account('--stan:Jan Kowalski')
  end

  def test_empty_person
    assert_nil(@result1)
  end

  def test_not_empty_person
    assert_equal(@result2, 'Jan Kowalski')
  end

  def test_too_many_operations
    assert_raises ArgumentError do
      main(['Jan Kowalski:1:100', 'Jan Kowalski:2:200', 'Jan Kowalski:1:-50', 'Anna N
owak:1:100', 'Jan Kowalski:1:100', 'Jan Kowalski:1:100', '--stan:Jan Kowalski']
      )
    end
  end

  def test_negative_balance
    assert_raises ArgumentError do
      main(['Jan Kowalski:1:100', 'Jan Kowalski:2:200', 'Anna N
owak:1:100', 'Jan Kowalski:1:100', 'Jan Kowalski:1:-300', '--stan:Jan Kowalski']
      )
    end
  end

end