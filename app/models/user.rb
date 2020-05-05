class User < ActiveRecord::Base

  validates :email, presence: true, :uniqueness => {:case_sensitive => false}
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password_confirmation, presence: true
  validates :password, presence: true, length: { minimum: 8 }
  
  has_secure_password

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip.downcase)
    if user && user.authenticate(password)
      return user
    end
  end

end