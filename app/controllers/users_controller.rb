class UsersController < ApplicationController

def show
  @user = User.find(params)
end

private

def recipe_params
  params.require(:user).permit(:user)
end


end

