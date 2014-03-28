class SupporterMailer < ActionMailer::Base
  default from: "from@example.com"

  def sent(user)
    @user = user
    mail(
    	to: @user.email, 
    	subject: "test")
  end

end
