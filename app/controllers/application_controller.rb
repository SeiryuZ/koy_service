class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :check_user, :except => [:login]



  private

  def check_user
    if session.blank? or session[:active_user].blank? 
      redirect_to root_path
    else
      @active_user = User.find(session[:active_user])
    end
  end



end
