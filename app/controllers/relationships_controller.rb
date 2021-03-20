class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find(params[:followed_id])
    current_user.follow!(@user)
    redirect_to request.referrer
  end

  def destroy
    @user = User.find(params[:followed_id])
    @relationship = Relationship.find(params[:id])
    current_user.unfollow!(@user)
    redirect_to request.referrer
  end
end
