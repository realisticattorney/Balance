class UsersController < ApplicationController
before_action :set_user, only: [:edit, :update]

def show
  @user = User.find(params)
end

def index
  @users = User.all.order(created_at: :desc)
end

private

def recipe_params
  params.require(:user).permit(:user, :avatar)
end

def set_user
  @user = User.find(params[:id])
end


end

