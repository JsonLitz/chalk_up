class Climb < ApplicationRecord

  has_many :comments
  validates :name, :image, :rating, :gear, :style, presence: { message: "%{value} must be given please"}
end
