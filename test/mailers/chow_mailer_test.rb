require 'test_helper'

class ChowMailerTest < ActionMailer::TestCase
  test "chowdown_request" do
    mail = ChowMailer.chowdown_request
    assert_equal "Chowdown request", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "chowdown_accepted" do
    mail = ChowMailer.chowdown_accepted
    assert_equal "Chowdown accepted", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "chowdown_details" do
    mail = ChowMailer.chowdown_details
    assert_equal "Chowdown details", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
