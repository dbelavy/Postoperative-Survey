class InviteMailer < ActionMailer::Base
  default from: "noreply@pre-op.net"
  
  
  
  def invite_email(patient,token)
    @user = patient
    @url  = 'http://postop.herokuapp.com/survey/???'
    mail(to: @user.email, 
         subject: 'Invitation to provide feedback'        
         )
  end
end
