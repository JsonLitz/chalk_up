class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :climb

  validates :title, length: {in: 2..100}, presence: true
  validates :body, length: { minimum: 2 }, presence: true
end
