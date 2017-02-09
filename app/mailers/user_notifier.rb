class UserNotifier < ActionMailer::Base
  default from: "from@example.com"
  
  def send_signup_email(user)
    @user = user
    mail( :to => @user.eamil,
    :subject => 'Thanks for signing up for our amazing app' )
  end
end
