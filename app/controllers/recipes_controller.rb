class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]

  def index
    @recipes = Recipe.includes([:user], user: { avatar_photo_attachment: :blob }).all.order(created_at: :desc)
    @users = User.all.order(created_at: :desc).with_attached_avatar_photo
  end

  def show; end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user

    if @recipe.save
      redirect_to root_path
    else
      redirect_to request.referrer, alert: 'Recipe was not created'
    end
  end

  def destroy
    authorize @recipe
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_recipe
    @recipe = Recipe.friendly.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:description, :avatar, :users)
  end
end
