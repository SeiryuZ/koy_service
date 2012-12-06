require 'spec_helper'

describe UserController do

  before do
    @user = create(:user)
    @admin = create(:admin)

  end

 


  describe "GET 'index'" do
    it "should redirect to root if not logged in" do
      get 'index'
      response.should redirect_to root_path
    end

    it "should render index_admin page if logged in as admin" do
      session[:active_user] = @admin.id
      get 'index'
      response.should render_template("index_admin")
    end

    it "should render index page if logged in as non admin" do
      session[:active_user] = @user.id
      get 'index'
      response.should render_template("index")
    end
  end

  describe "GET 'new'" do
    it "should redirect to root if not logged in" do
      get 'new'
      response.should redirect_to root_path
    end

    it "should render the new user page if logged in" do
      session[:active_user] = @admin.id
      get 'new'
      response.should be_success
    end
  end

  describe "'create' method" do
    it "should redirect to root if not logged in" do
      get 'create'
      response.should redirect_to root_path
    end

    it "should create user successfully with valid data" do
      session[:active_user] = @admin.id
      post 'create', :user =>{ :username => "steven" , :password => "qwe", :password_confirmation => "qwe" }
      response.should redirect_to user_index_path
    end

    it "should render the new page when unsuccessful create is initiated" do
      session[:active_user] = @admin.id
      post 'create', :user => { :username => "steven" , :password => "qwe", :password_confirmation => "qwe1" }
      response.should render_template("new")

    end
  end

  describe "GET 'update'" do
    it "should redirect to root if not logged in" do
      get 'update'
      response.should redirect_to root_path
    end
  end

  describe "GET 'edit'" do
    it "should redirect to root if not logged in" do
      get 'edit'
      response.should redirect_to root_path
    end

    it "should render the edit user page if logged in" do
      session[:active_user] = @admin.id
      response.should be_success
    end
  end



  describe "destroy action" do
    it "should delete user correctly and redirect to user index_admin" do
      session[:active_user] = @admin.id
      post 'destroy', :id=> @user.id
      expect {User.find(@user.id)}.to raise_error
      response.should redirect_to(user_index_path)
    end

    it "should not delete user when not authenticated as admin" do
      session[:active_user] = @user.id
      post 'destroy', :id=> @user.id
      User.find(@user.id).should == @user
      response.should redirect_to(user_index_path)
    end

    it "should redirect to root if not logged in" do
      post 'destroy', :id=> @user.id
      response.should redirect_to root_path
    end

  end

  describe "GET 'login'" do
    it "returns http success" do
      get 'login'
      response.should be_success
    end
  end

  describe "GET 'logout'" do
    it "should destroy active user session and redirected to login page" do
      session[:active_user] = @admin.id
      session[:active_user].should_not == nil
      get 'logout'
      session[:active_user].should == nil
      response.should redirect_to(root_path)
      
    end
  end

  describe "POST 'login'" do
    it "should redirect to login page if authentication fail" do
      post 'login', :username => @admin.username, :password => "password"
      response.should redirect_to(root_path)
      post 'login', :username => @admin.username, :password => "pa123sswordadmin"
      response.should redirect_to(root_path)
    end 

    it "should redirect to index page if authentication succeed" do
      post 'login', :username => @admin.username, :password => "bar"
      
      session[:active_user].should == @admin.id
      response.should redirect_to(user_index_path)
    end

    it "should fail gracefully if one of the value is nil / empty" do
      post 'login', :username => "", :password => "pa123sswordadmin"
      response.should redirect_to(root_path)
      post 'login', :username => "admin", :password => ""
      response.should redirect_to(root_path)
    end
  end

end
