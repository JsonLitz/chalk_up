class Checkin < ApplicationRecord
  belongs_to :climb
  belongs_to :user
end
