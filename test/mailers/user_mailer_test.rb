require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "account_activation" do
    user = users(:admin)
    user.activation_token = User.new_token
    mail = UserMailer.account_activation(user)
    assert_equal "アカウント有効化について", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["noreply@example.com"], mail.from
    assert_match user.name, mail.text_part.body.to_s.encode("UTF-8")
    assert_match user.activation_token, mail.text_part.body.to_s.encode("UTF-8")
    assert_match CGI.escape(user.email), mail.text_part.body.to_s.encode("UTF-8")
  end

  test "password_reset" do
    user = users(:admin)
    user.reset_token = User.new_token
    mail = UserMailer.password_reset(user)
    assert_equal "パスワード初期化について", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["noreply@example.com"], mail.from
    assert_match user.reset_token, mail.text_part.body.to_s.encode("UTF-8")
    assert_match CGI.escape(user.email), mail.text_part.body.to_s.encode("UTF-8")
  end
end
