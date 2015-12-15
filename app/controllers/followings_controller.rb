class FollowingsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @following = Following.new
    @following.leader_id = params[:user_id]
    @following.follower_id = current_user.id
    @following.save
    redirect_to User.find(params[:user_id])
  end
  
  def destroy
    @user = User.find(params[:user_id])
    @user.followings.find_by(follower_id: current_user.id).destroy
    
    redirect_to user_path(User.find(params[:user_id]))
  end
end
