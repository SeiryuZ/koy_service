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

  def login

    if request.post?
      @user = User.find_by_username(params[:username])
      if @user and @user.password == params[:password]
        redirect_to :action => "index"
      else
        redirect_to root_path
      end
    end

  end
  
end
