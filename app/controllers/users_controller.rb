class UsersController < ApplicationController

  def index
    @user = User.find_by(username: params[:username])
  end

  def show
    @user = User.find_by(username: params[:username])
    @posts = current_user.posts.all
  end
end
