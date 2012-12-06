require 'bcrypt'
class User < ActiveRecord::Base
  include BCrypt
  attr_accessible  :username

  validates :username, presence: true, uniqueness: true
  validates :password, presence:true, :confirmation => true
  validates :password_confirmation, :presence => true

  def password
    if not password_hash.nil?
      @password ||= Password.new(password_hash)
    else
      nil
    end
  end

  def password=(new_password)
    if not new_password.blank?
      @password = Password.create(new_password)
      self.password_hash = @password
    else
      self.password_hash = nil
    end
  end


  def is_admin?
    self.admin
  end
  
  def set_admin=(admin)
    self.admin = admin
  end



  def self.authenticate(username, password)
    user = find_by_username(username)

    if not user.nil? and user and user.password == password
      user 
    else
      false
    end
  end


end
