class UsersController < ApplicationController
before_action :set_user, only: [:edit, :update]

def show
  @user = User.find(params)
end

private

def recipe_params
  params.require(:user).permit(:user)
end

def set_user
  @user = User.find(params[:id])
end


end

