class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_activation.subject
  #
  def account_activation(user)
      @user = user #"Hi, Sending Emails in Rails"

    mail to: user.email, subject: "Account Activation" #"starletgh@gmail.com"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset
    @greeting = "Hi, Please Reset your password here dummy"

    mail to: "starletgh@gmail.com"
  end
end
