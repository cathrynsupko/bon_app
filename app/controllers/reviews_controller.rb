class ReviewsController < ApplicationController
  before_action :authenticate_user!

  
  def create
    @post = Post.find(params[:post_id])
    @review = @post.reviews.build(review_params)
    @review.review_author_id = current_user.id
    @review.save
    redirect_to @post
  end
  
  def edit
    @post = Post.find(params[:post_id])
    @review = Review.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:post_id])
    @review = Review.find(params[:id])
    authorize_user(@review)
    @review.update_attributes(review_params)
    @review.save
    redirect_to @post
  end
  
  def destroy
    @review = Review.find(params[:id])
    @post = Post.find(params[:post_id])
    authorize_user(@review)
    @review.destroy
    redirect_to @post
  end
  
  private
  
    def review_params
      params.require(:review).permit(:rating, :content)
    end
    
    def authorize_user(review)
      unless review.review_author == current_user
        flash[:notice] = "You must be the author of this review to proceed."
        redirect_to review.reviewed_post
      end
    end
end
