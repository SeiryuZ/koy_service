class UserController < ApplicationController
  def index
  end

  def new

  end

  def create
  end

  def update
  end

  def edit
  end

  def logout
    session[:active_user] = nil

    flash[:notice] = "Anda telah berhasil logout"

    redirect_to root_path
  end

  def login

    if request.post?
      @user = User.find_by_username(params[:username])
      if @user and @user.password == params[:password]
        
        session[:active_user] = @user.id
        redirect_to :action => "index"
      else
        flash[:error] = "Maaf, Password anda salah"
        redirect_to root_path
      end
    end

  end
  
end
