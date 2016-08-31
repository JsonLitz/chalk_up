class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :climb

  validates :title, length: {in: 2..30}, presence: true
  validates :body, length: {in: 2..300}, presence: true
end
