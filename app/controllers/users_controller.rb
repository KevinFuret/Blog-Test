class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(username: params[:username])
    @posts = @user.posts.all
  end
end
