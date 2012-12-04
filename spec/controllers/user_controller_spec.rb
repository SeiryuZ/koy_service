require 'spec_helper'

describe UserController do

  before do
    @user = User.new()
    @user.username = "admin"
    @user.password = "passwordadmin"
    @user.save
  end

  describe "GET 'index'" do
    it "should redirect to root if not logged in" do
      get 'index'
      response.should redirect_to root_path
    end
  end

  describe "GET 'new'" do
    it "should redirect to root if not logged in" do
      get 'new'
      response.should redirect_to root_path
    end

    it "should render the new user page if logged in" do
      session[:active_user] = User.find_by_username("admin").id
      response.should be_success
    end
  end

  describe "GET 'create'" do
    it "should redirect to root if not logged in" do
      get 'create'
      response.should redirect_to root_path
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

    it "should render the new user page if logged in" do
      session[:active_user] = User.find_by_username("admin").id
      response.should be_success
    end
  end

  describe "GET 'login'" do
    it "returns http success" do
      get 'login'
      response.should be_success
    end
  end

  describe "POST 'login'" do
    it "should redirect to login page if authentication fail" do
      post 'login', :username => "admin", :password => "password"
      response.should redirect_to(root_path)
      post 'login', :username => "admin", :password => "pa123sswordadmin"
      response.should redirect_to(root_path)
    end 

    it "should redirect to index page if authentication succeed" do
      post 'login', :username => "admin", :password => "passwordadmin"
      
      session[:active_user].should == User.find_by_username("admin").id
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
