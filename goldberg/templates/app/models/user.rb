require 'digest/sha1'

class User < ActiveRecord::Base
  attr_accessor :clear_password
  validates_uniqueness_of :name

  def role
    if self.role_id
      @role ||= Role.find(self.role_id)
    end
    return @role
  end
    

  def before_save
    if self.clear_password  # Only update the password if it has been changed
      self.password = User.hash_password(self.clear_password)
    end
  end

  def after_save
    self.clear_password = nil
  end

  def self.find_by_name_and_password(name, password)
    hashed_password = self.hash_password(password)
    find(:first, 
         :conditions => ["name = ? and password = ?", name, hashed_password])
  end


  protected
  
  def self.hash_password(password)
    Digest::SHA1.hexdigest(password)
  end

end
