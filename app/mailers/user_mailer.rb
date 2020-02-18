class UserMailer < ApplicationMailer
  default from: 'no-reply@monsite.fr'
 
  def welcome_email(user)
    @user = user 
    @url  = 'http://monsite.fr/login' 
    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end

  def new_participant_email(attendance)
    @attendance = attendance
    @user = attendance.event.admin
    mail(to: @user.email, subject: 'Un nouveau participant à votre événement')
  end
end
