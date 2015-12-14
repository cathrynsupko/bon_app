class Review < ActiveRecord::Base
  belongs_to :review_author, class_name: "User"
  belongs_to :reviewed_post
  
  validates :content, presence: true
  validates :rating, presence: true
end
