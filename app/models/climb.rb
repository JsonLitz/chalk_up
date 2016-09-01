class Climb < ApplicationRecord
  has_many :comments
  has_many :checkins
  validates :name, :image, :rating, :gear, :style, presence: { message: "%{value} must be given please"}
end
