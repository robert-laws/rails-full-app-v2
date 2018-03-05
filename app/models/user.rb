class User < ActiveRecord::Base
  has_secure_password

  has_many :addresses, dependent: :destroy
  has_many :dogs, dependent: :destroy

  accepts_nested_attributes_for :addresses
  accepts_nested_attributes_for :dogs

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