module ApplicationHelper
  
  def photo(link)
    link ||= "https://source.unsplash.com/random/200x200"
  end

  # rubocop:disable Lint/UselessAssignment
  def cover_image(link)
    link ||= "https://source.unsplash.com/random/600x200"
  end
  # rubocop:enable Lint/UselessAssignment

  def following?(user)
    current_user.following.include?(user)
  end

  def current_user?(user)
    user.id == session[:user_id]
  end

  def like_button(recipe)
    like = Like.find_by(recipe: recipe, user: current_user)
    if like
      link_to('Dislike!', recipe_like_path(id: like.id, recipe_id: recipe.id), method: :delete, class: 'btn btn-twitter align-self-center')
    else
      link_to('Like!', recipe_likes_path(recipe_id: recipe.id), method: :post,  class: 'btn align-self-center')
    end
  end


  def cover_for(user)
    @cover = user.cover_photo
    if @cover.nil?
        @cover_user = image_tag("600x200.jpeg")
    else
        @cover_user = user.cover_photo
    end
    return @cover_user
end

  def avatar_for(user)
    @avatar = user.avatar_photo
    if @avatar.nil?
        @avatar_user = image_tag("200x200.jpeg")
    else
        @avatar_user = user.avatar_photo
    end
    return @avatar_user
end

def is_current_user?(user)
  if user == current_user
    render 'recipes/recipe_from_index'
  end
end



end
