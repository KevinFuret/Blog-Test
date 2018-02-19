class CommentsController < ApplicationController

  before_action :find_post
  before_action :find_comment, only: [:destroy, :edit, :update, :comment_owner]
  before_action :comment_owner, only: [:destroy, :edit, :update]

  before_action :authenticate_user!

  def create
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to @post
  end

  def destroy
    @comment.destroy
    redirect_to post_path(@post)
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end


  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def find_comment
    @comment = @post.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

  def comment_owner
    unless current_user == @comment.user
      redirect_to @post
    end
  end
end
