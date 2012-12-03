require 'bcrypt'
class User < ActiveRecord::Base
  include BCrypt
  attr_accessible  :username

  validates :username, presence: true, uniqueness: true
  validates :password_hash, presence:true

  def password
    @password ||= Password.new(password_hash)
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


end
