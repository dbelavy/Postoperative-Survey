class InviteMailer < ActionMailer::Base




  def invite_email(patient_details_hash)
    @email_details_hash = patient_details_hash
    @url = @email_details_hash[:url]
    puts "Attempting to send invitation to: " + @email_details_hash[:name].to_s + " at " + @email_details_hash[:email]

    mail(
      to:        @email_details_hash[:email],
      from:      ENV["GMAIL_USERNAME"],
      subject:   @email_details_hash[:subject],
      body:      @url
        )
  end


  def send_new_response_notification()
    puts "Attempting to send new questionnaire notification to: " + ENV["ADMIN_EMAIL"].to_s

    mail(
      to:        ENV["ADMIN_EMAIL"],
      from:      ENV["GMAIL_USERNAME"],
      subject:   "New questionnaire completed"
      )
  end



end



