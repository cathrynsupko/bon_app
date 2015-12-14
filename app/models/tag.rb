class Tag < ActiveRecord::Base
  has_many :taggings, foreign_key: "tag_id"
  has_many :tagged_posts, through: :taggings, source: :tagged_post
end
