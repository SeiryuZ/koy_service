class UserController < ApplicationController
  def index
    if @active_user.is_admin?
      @users = User.page(params[:page])
      render "index_admin"
    else
      render "index"
    end
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

      if @user = User.authenticate(params[:username], params[:password])
        session[:active_user] = @user.id
        redirect_to :action => "index"
      else
        flash[:error] = "Maaf, Password anda salah"
        redirect_to root_path
      end

    end

  end
  
end
