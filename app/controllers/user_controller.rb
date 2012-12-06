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

  def destroy
    if request.post? &&
      if @active_user.is_admin? 

        User.destroy(params[:id])
        flash[:notice] = "User telah dihapus"

      else
        flash[:notice] = "Anda bukan admin"
      end
    else
      flash[:error] = "Ada Error"
    end

    redirect_to :action => "index"
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
