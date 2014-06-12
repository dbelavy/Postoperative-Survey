class Patient < ActiveRecord::Base
  
  
  #assign a token code before creating a new patient.  Need to add check unique process.
  before_create :make_token
  
  def make_token
      self.token = SecureRandom.urlsafe_base64(6,false)
  end
  
end
