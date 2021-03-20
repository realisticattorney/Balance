class LikesController < ApplicationController
  def create
    @like = current_user.likes.new(recipe_id: params[:recipe_id])

    if @like.save
      redirect_to request.referrer, notice: 'You liked a recipe.'
    else
      redirect_to request.referrer, alert: 'You cannot like this recipe.'
    end
  end

  def destroy
    like = Like.find_by(id: params[:id], user: current_user, recipe_id: params[:recipe_id])
    if like
      like.destroy
      redirect_to request.referrer
    else
      redirect_to request.referrer, alert: 'You cannot dislike recipe that you did not like before.'
    end
  end
end
