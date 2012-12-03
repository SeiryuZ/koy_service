require 'spec_helper'

describe UserController do

  before do
    @user = User.new()
    @user.username = "admin"
    @user.password = "passwordadmin"
    @user.save
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      get 'create'
      response.should be_success
    end
  end

  describe "GET 'update'" do
    it "returns http success" do
      get 'update'
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    it "returns http success" do
      get 'edit'
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
