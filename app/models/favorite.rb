class Favorite < ActiveRecord::Base
  belongs_to :favoriting_user, class_name: "User"
  belongs_to :favorited_post, class_name: "Post"
end
