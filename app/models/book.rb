class Book < ApplicationRecord
  
  belongs_to :user
  
  validates :title, presence: true
  validates :body, presence: true, length: { in: 1..200 }
  has_one_attached :profile_image
  
end
