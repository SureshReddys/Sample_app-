class UserMailer < ApplicationMailer

	layout 'mailer.html.erb'

	default :from => "sureshror56@gmail.com"

	  def welcome_email(user)
        @admin_user = user
       #@url  = user_url(@user)
         mail(:to => user.email,
           :subject => "Welcome to My Awesome Site") do |format|
         format.html
         #format.text
      end 
      end 
end
