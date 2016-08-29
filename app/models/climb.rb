class Climb < ApplicationRecord
  validates :name, :image, :rating, :gear, :style, presence: { message: "%{value} must be given please"}
  validates :geolocation, :gym?, inclusion: { in: [true, false] }
end
