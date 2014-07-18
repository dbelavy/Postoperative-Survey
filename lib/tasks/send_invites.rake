


namespace :mail_admin do

  task :send_invites => :environment do
    Patient.all.each do |patient|
      if patient.datesent == nil and patient.senddate < DateTime.now
        
        #make URL with the patient token as a param
        @url = ENV["APPLICATION_URL"] + '/questionnaires/new/?token=' + patient.token
        
        #create a hash with the details to send
        patient_details_hash = { :name => patient.name, :email => patient.email, :subject => "Recovery questionnaire", :url => @url }
        
        #sends the email
        InviteMailer.invite_email(patient_details_hash).deliver
        
        #updates the datesent variable to now
        patient.update_attribute(:datesent, DateTime.now)
        
        #puts a message on the console saying it has been done.  This doesn't confirm receipt
        puts "Invite sent to " + patient.name + "on" + patient.datesent
     
      
      end
    end
  end   
  
  task :send_new_questionnaire_email => :environment do
    #sends a message notifying of new response received on the system
    InviteMailer.send_new_response_notification().deliver
  end
  
  
  
end

# + "/questionnaire/?token=" + patient.token
