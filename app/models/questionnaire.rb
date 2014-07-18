class Questionnaire < ActiveRecord::Base
  
  validates_presence_of :questions_concerns, :safe_relaxed, :pain_management, :ponv, :same_anaesthetic, :confident_ability, :cared_for, :anaesthetic_experience
  
  include Rails.application.routes.url_helpers
  
 # before_create :check_if_exists
  after_create :send_new_response_notification
  
 # def check_if_exists
 ##   if Questionnaire.where(token: params[:token]).exists?
 #    redirect_to root, :flash => { :error => "Sorry, this questionnaire has already been completed." }
 #   end
 # end
  
  
  def send_new_response_notification
    InviteMailer.send_new_response_notification().deliver
  end
  
end


