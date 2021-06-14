require 'test_helper'

class CreditTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "amount_available returns the relevant credit amount for the user" do
    credit = Credit.new(amount_redeemed: 0, balance: 20, application: 'application_1', favour: 'plumbing_house', favour_type: 'plumbing')
    assert_equal "20", credit.amount_available
  end

  test "balance returns the relevant balance for the user" do
    credit = Credit.new(amount_redeemed: 0, balance: 20, application: application_1, favour: plumbing_house, favour_type: plumbing)
    assert_equal "20", credit.balance
  end
end
