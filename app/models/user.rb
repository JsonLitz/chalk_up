class User < ApplicationRecord
  has_secure_password
  has_many :comments
  has_many :climbs, :through => :comments

  validates :username, presence: true, length: { maximum: 15 }
  validates :password_digest, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email,
    presence:   true,
    format:     { with: VALID_EMAIL_REGEX },
    uniqueness: true,
    length:     { maximum: 255 }

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:password])
  end
end
