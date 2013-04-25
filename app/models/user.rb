
class User < ActiveRecord::Base
  include BCrypt
  has_many :urls
  before_create :hash_password
  validates :email, :uniqueness => true


  def self.authenticate(email, password)
    user = User.find_by_email(email)
    return nil unless user
    db_password = Password.new(user.password)
    if db_password == password
      return user
    else
      return nil
    end
  end


  private
  def hash_password
    self.password = Password.create(self.password)
  end  
end
