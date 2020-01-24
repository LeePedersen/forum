
class CommentsController < ApplicationController


  #before_action :authorize, only: [:new, :create, :edit]
  #before_action :authorize_admin, only: [:new, :create, :edit, :destroy]

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
    # @user = User.find(session[:user_id])
    # @user_name = @user.email
    render :new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    if @comment.save
      flash[:notice] = "You have saved your comment"
      redirect_to posts_path
    else
      flash[:alert] = "There was a problem saving your comment"
      render :new
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    render :edit
  end

  def show
    @comment = Comment.find(params[:id])
    render :show
  end

  def update
    @comment= Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to comments_path
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to comments_path
  end

  private
  def comment_params
    params.require(:comment).permit(:title, :body, :user_name, :post_id)
  end

end
