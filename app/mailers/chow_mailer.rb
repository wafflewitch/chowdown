class ChowMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.chow_mailer.chowdown_request.subject
  #
  def chowdown_request(chow)
    @recipient = User.find(chow.user_2_id)
    # TODO: send email to RECEIVING user!
    @greeting = "Hi, #{@rrecipient.first_name}!"

    mail(to: @recipient.email, subject: "You've got a chowdown request!")
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.chow_mailer.chowdown_accepted.subject
  #
  def chowdown_accepted
    @greeting = "Hi, #{@user.first_name}!"

    mail(to: @user.email, subject: "Your chowdown request was accepted!")
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.chow_mailer.chowdown_details.subject
  #
  def chowdown_details
    @greeting = "Hi, #{@user.first_name}!"

    mail(to: @user.email, subject: "It's chowdown time!")
  end
end
