class ApplicationController < ActionController::Base
  protect_from_forgery
session :session_key => '_ProjectManagement_session_id' 
  protected
    def confirm_logged_in
    unless session[:user_id]
      flash[:notice] = "Please log in."
      redirect_to(:controller => 'admin', :action => 'login')
      return false # halts the before_filter
    else
      return true
    end
  end
end 
