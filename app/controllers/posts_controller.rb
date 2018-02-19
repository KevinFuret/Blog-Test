class PostsController < ApplicationController

  before_action  only: [:show, :update, :update, :destroy]
  before_action :authenticate_user!

  def index
    if Post.last.nil? == false
      @latest_post = Post.last
      @posts = Post.where.not(id: @latest_post.id).order('created_at DESC')
    else
      @posts = Post.all
    end
  end

  def new
    @post = current_user.posts.build
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.where(post_id: @post).order('created_at DESC')
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.build(post_params)
    redirect_to '/' if @post.save
  end

  def update
    Post.find(params[:id]).update(post_params)
    redirect_to "/posts/#{params[:id]}"
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to '/'
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :image)
  end
end
