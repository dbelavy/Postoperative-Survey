class Patient < ActiveRecord::Base
  

  #  schema
  #  t.string   "name"
  #  t.string   "email"
  #  t.string   "procedure"
  #  t.string   "survey"
  #  t.datetime "senddate"
  #  t.string   "token"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #  t.datetime "datesent"
  #  t.datetime "dateremindersent"
  #  t.string   "bounce_details"
  belongs_to :user

  has_many :feedback_attributes
  
  #assign a token code before creating a new patient.  Need to add check unique process.
  before_create :make_token
  
  def make_token
    self.token = SecureRandom.urlsafe_base64(6,false)
    while Patient.exists?(token: self.token)
      self.token = SecureRandom.urlsafe_base64(6,false)
    end
  end

  validates_presence_of :name, :email, :senddate

end
