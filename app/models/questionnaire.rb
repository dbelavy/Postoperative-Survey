class Questionnaire < ActiveRecord::Base
  
  validates_presence_of :questions_concerns, :safe_relaxed, :pain_management, :ponv, :same_anaesthetic, :confident_ability, :cared_for, :anaesthetic_experience
  
  include Rails.application.routes.url_helpers
  
end


