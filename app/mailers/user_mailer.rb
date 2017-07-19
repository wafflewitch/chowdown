class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
    @user = user
    @greeting = "Hi, #{@user.first_name}!"

    mail(to: "dawning.herald@gmail.com", subject: "Welcome to Chowdown!")
  end
end
