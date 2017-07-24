require 'test_helper'

class DecisionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'cannot make a decision with myself' do
    d = Decision.new(:user_1_id == :user_2_id)
    assert_not d.valid?, "cannot make a decision with myself"
  end

  test 'can make a decision with other user' do
    d = Decision.new(:user_1_id != :user_2_id)
    assert d.valid?, "can make a decision with other user"
  end
end
