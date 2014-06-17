class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  #put this in for devise and rapidfire
   def can_administer?
     user_signed_in?
   end
   
end
