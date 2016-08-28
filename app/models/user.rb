class User < ApplicationRecord
  has_secure_password
  validates :username, :password, presence: true, length: { maximum: 15 }

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
