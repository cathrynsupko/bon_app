class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :posts, foreign_key: "author_id"
  has_many :reviews, foreign_key: "review_author_id"
  
  has_many :followings, foreign_key: "follower_id", dependent: :destroy
  has_many :leadings, class_name: "Following", foreign_key:"leader_id", dependent: :destroy
  
  has_many :followers, through: :leadings, source: :follower
  has_many :leaders, through: :followings, source: :leader
  
  has_many :favorites, foreign_key: "favoriting_user_id"
  has_many :favorited_posts, through: :favorites, source: :favorited_post
end
