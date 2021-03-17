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

end
