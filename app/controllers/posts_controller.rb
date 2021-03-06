class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def new
    @post = Post.new
  end
  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end
  
  def show
    @post = Post.find(params[:id])
    @review = Review.new
  end
  
  private
    def post_params
      params.require(:post).permit(:title, :image, :directions,
        ingredients_attributes: [:id,  :content, :_destroy] )
    end
end
