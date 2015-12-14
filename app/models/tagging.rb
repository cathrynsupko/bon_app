class Tagging < ActiveRecord::Base
  belongs_to :tag
  belongs_to :tagged_post, class_name: "Post"
end
