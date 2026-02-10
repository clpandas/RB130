require 'minitest/autorun'

class TestList < Minitest::Test
  def test_list_is_empty
    list = []
    assert_equal(true, list.empty?)
    # LS solution
    # assert_empty(list)
  end
end