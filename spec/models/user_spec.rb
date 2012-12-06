require 'spec_helper'

describe User do
  

  before do
    @user = create(:user)
    @admin = create(:admin)
  end


  subject { @user }


  describe "When initialized" do
    it "should respond to desired methods" do

      should respond_to(:username) 
      should respond_to(:password) 
      should respond_to(:set_admin=) 
      should respond_to(:is_admin?)
      User.should respond_to(:authenticate)

    end

    it "should not respond to undesired methods" do 

    end


    it "should be valid " do
      should be_valid
    end

  end

  describe "When Username is not present" do 
    before { @user =  build(:user, :username => "") }
    it { should_not be_valid }
  end

  describe "Password is not present" do
    before { @user= build(:user, :password=> "", :password_confirmation => "") }
    it { should_not be_valid }
  end

  describe "When password and password_confirmation is not present" do
    before do
      @user.password = "123"
      @user.password_confirmation = "!23"
    end
    it {should_not be_valid}
  end


  describe "When Username is already taken" do
    before do 
      @user = build(:user, :username => @admin.username)
    end

    it { should_not be_valid }
  end


  describe "When user admin status is changed" do

    it "should change the status correctly" do
      @user.set_admin = true
      @user.is_admin?.should == true
      @user.is_admin?.should_not == false

      @user.set_admin = false
      @user.is_admin?.should == false
      @user.is_admin?.should_not == true
    end

  end

  describe "When asked to authenticate" do

    it "should return the user object when authenticated" do
      User.authenticate(@user.username, "bar").should == @user
      User.authenticate(@admin.username, "bar").should == @admin
    end

    it "should return false when not authenticated" do
      User.authenticate(@user.username, "bar123").should == false
      User.authenticate(@admin.username, "ba123").should == false
    end

  end



end
