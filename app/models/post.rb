class Post < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  has_many :reviews, foreign_key: "reviewed_post_id"
  
  has_many :favorites, foreign_key: "favorited_post_id"
  has_many :favoriting_users, through: :favorites, source: :favoriting_user
  
  has_many :taggings, foreign_key: "tagged_post_id"
  has_many :tags, through: :taggings, source: :tag
  
  has_many :ingredients
  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true
  
  has_attached_file :image, styles: { small:"200x200", large:"500x500" }
  
  validates :title, presence: true
  validates :directions, presence: true
  validates :author_id, presence: true
  
  
  validates_attachment_presence :image
  validates_attachment_size :image, :less_than => 5.megabytes
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']

end
