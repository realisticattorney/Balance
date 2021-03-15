class UsersController < ApplicationController
before_action :set_user, only: [:edit, :update]

def show
  @users = User.all.order(created_at: :desc).includes([:image_attachment])
  @user = User.find(params[:id])
  @recipe = Recipe.new
  @recipe = Recipe.all.order(created_at: :desc)
  @follow = Relationship.new
end

def index
  @users = User.all.order(created_at: :desc)
end

def following
  @title = "Following"
  @user = User.find(params[:id])
  @users = @user.followed_users.find(params)
  render 'show_follow'
end

def followers
  @title = "Followers"
  @user = User.find(params[:id])
  if @user.followers.any?
    @users = @user.followers.find(params)
  end
  render 'show_follow'
end

private

def recipe_params
  params.require(:user).permit(:email, :avatar)
end

def set_user
  @user = User.find(params[:id])
end


end

