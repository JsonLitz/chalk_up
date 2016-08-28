class Climb < ApplicationRecord

  VALID_IMAGE_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :image,
    presence:   true,
    format:     { with: VALID_IMAGE_REGEX },
    uniqueness: true,
    length:     { maximum: 255 }

end
