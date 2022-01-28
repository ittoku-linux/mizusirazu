class UserMailer < ApplicationMailer
  def account_activation(user)
    @user = user

    mail to: user.email, subject: 'Account activation'
  end

  def reset_password(user)
    @user = user

    mail to: user.email, subject: 'Reset password'
  end
end
