class ChowMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.chow_mailer.chowdown_request.subject
  #
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.chow_mailer.chowdown_accepted.subject
  #
  def chowdown_active_user1(chow)
    @chow = chow
    id = @chow.user_1_id
    @user1 = User.find(id)
    @greeting = "Hey, #{@user1.first_name}!"

    mail(to: @user1.email, subject: "You've got a Chowdown!")
  end

  def chowdown_active_user2(chow)
    @chow = chow
    id = @chow.user_2_id
    @user2 = User.find(id)
    @greeting = "Hey, #{@user2.first_name}!"

    mail(to: @user2.email, subject: "You've got a Chowdown!")
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.chow_mailer.chowdown_details.subject
  #
  # def chowdown_finalized(chow)
  #   @greeting = "Hi, #{chow.user2.first_name}!"

  #   mail(to: @user.email, subject: "It's chowdown time!")
  # end
end
