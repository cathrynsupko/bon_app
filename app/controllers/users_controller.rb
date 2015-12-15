class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @following = Following.new 
    @f = Following.where("leader_id = ? AND follower_id = ?", @user.id, current_user.id)
  end
end
