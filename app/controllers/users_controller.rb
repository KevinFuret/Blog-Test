class UsersController < ApplicationController

  def index
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @posts = current_user.posts.all
  end
end
