require 'minitest/autorun'

require_relative 'transaction'

class TransactionTest < Minitest::Test
  # def test_prompt_for_payment
  #   transaction = Transaction.new(20)
  #   input = StringIO.new('20')
  #   transaction.prompt_for_payment(input: input)
  #   assert_equal(20, transaction.amount_paid)
  # end

  def test_prompt_for_payment
    transaction = Transaction.new(20)
    input = StringIO.new('20')
    output = StringIO.new
    transaction.prompt_for_payment(input: input, output: output)
    assert_equal(20, transaction.amount_paid)
  end
end