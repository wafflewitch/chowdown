class ChowMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.chow_mailer.chowdown_request.subject
  #
  def chowdown_request(chow)
    @recipient = chow.user2
    # TODO: send email to RECEIVING user!
    @greeting = "Hi, #{@recipient.first_name}!"

    mail(to: @recipient.email, subject: "You've got a chowdown request!")
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.chow_mailer.chowdown_accepted.subject
  #
  def chowdown_accepted(chow)
    @greeting = "Hi, #{chow.user1.first_name}!"

    mail(to: "s@s.com", subject: "Your chowdown request was accepted!")
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.chow_mailer.chowdown_details.subject
  #
  def chowdown_details(chow)
    @greeting = "Hi, #{chow.user2.first_name}!"

    mail(to: @user.email, subject: "It's chowdown time!")
  end
end
