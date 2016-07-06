class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def current_user
  	#set current_user to session ID if that ID has been set
  	User.find(session[:id]) if session[:id]
  end
  helper_method :current_user
  #helper_method lets youse use :current_user as variable throughout
end
