class User < ActiveRecord::Base
  has_secure_password

  validates :username, presence: true
  # validates :username, uniqueness: true

  validates :email, presence: true

  def self.find_or_create_by_omniauth(auth_hash)
    oauth_email = auth_hash["info"]["email"]
    where(email: oauth_email).first_or_create do |user|
      user.username = oauth_email.split("@")[0]
      user.password = SecureRandom.hex
    end
  end
end
