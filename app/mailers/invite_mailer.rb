class InviteMailer < ActionMailer::Base
  default from: ENV["GMAIL_USERNAME"]
  default
  
  
  


  def invite_email(patient_to_invite, user, token)
    @email_details_hash = patient_to_invite
    @user = user
    @token = token
    @url = ENV["APPLICATION_URL"] + '/questionnaire/new/?token=' + @token
   # @to = email_details_hash[:email]
    mail(
      to: @email_details_hash["email"],
      subject: @email_details_hash["subject"],
      
        )
  end

end



#   def feedback_request(user, feedback)
#    @user = user
#    @feedback = feedback
#    @url  = 'http://thisistheexampleurlforfeedback'
#    mail(to: @feedback.p_email, subject: "#{@user.first_name} #{@user.last_name} has requested your feedback", from: @user.email)
#  end