class UserMailer < ApplicationMailer
  def invitation_email(user)
    @user = user
    mail(to: @user.email, subject: 'Invitation to CPL Snooker League App')
  end
end

