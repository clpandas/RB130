require 'minitest/autorun'

class TestValue < Minitest::Test
  def test_value_is_odd
    value = 3

    assert_equal(true, value.odd?)
    # LS solution
    # assert(value.odd?, 'value is not odd')
  end
end