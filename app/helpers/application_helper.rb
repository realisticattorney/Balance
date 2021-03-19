# rubocop:disable Style/GuardClause
# rubocop:disable Layout/LineLength
module ApplicationHelper
  def following?(user)
    current_user.following.include?(user)
  end

  def current_user?(user)
    user.id == session[:user_id]
  end

  def signed
    if signed_in?
      render 'layouts/sidebar'
    else
      render 'layouts/sidebar_before_signed'
    end
  end

  def like_button(recipe)
    like = Like.find_by(recipe: recipe, user: current_user)
    if like
      link_to('Dislike!', recipe_like_path(id: like.id, recipe_id: recipe.id), method: :delete,
                                                                               class: 'btn btn-light align-self-center')
    else
      link_to('Like!', recipe_likes_path(recipe_id: recipe.id), method: :post, class: 'btn btn-primary  text-light align-self-center')
    end
  end

  def cover_for(user)
    @cover = user.cover_photo
    @cover_user = if @cover.nil?
                    image_tag('600x200.jpeg')
                  else
                    user.cover_photo
                  end
    @cover_user
  end

  def avatar_for(user)
    @avatar = user.avatar_photo
    @avatar_user = if @avatar.nil?
                     image_tag('200x200.jpeg')
                   else
                     user.avatar_photo
                   end
    @avatar_user
  end

  def allowed_to_post?(user)
    render 'recipes/recipe_from_index' if user == current_user
  end

  def feed(recipe, user)
    if user.recipes.empty?
      '%h3 No predictions available yet'.html_safe
    else
      render 'users/feed', user: user, recipe: recipe
    end
  end

  def authorized_edit?(recipe)
    if policy(recipe).edit?
      link_to('Destroy', recipe, method: :delete, data: { confirm: 'Are you sure?' },
                                 class: 'btn btn-light   align-self-center')
    else
      like_button(recipe)
    end
  end

  def who_to_follow(user)
    render 'recipes/rightbar', user: user unless current_user.id == user.id || current_user.following?(user)
  end

  def followed_by(user, other_user)
    render 'users/rightbar_user', user: other_user if other_user.following?(user) && other_user != current_user
  end

  # rubocop:disable Lint/UselessAssignment
  def user_profile_stats(user)
    if user ||= current_user
      render 'users/user'
    end
  end

  # rubocop:enable Lint/UselessAssignment
  def before_signed
    if devise_mapping.registerable? && controller_name != 'registrations'
      link_to('Sign Up', new_user_registration_path, class: 'nav-link')
      link_to('Log In', new_user_session_path, class: 'nav-link bg-white')
    end
    if controller_name != 'sessions'
      link_to('Sign Up', new_user_registration_path, class: 'nav-link bg-white')
      link_to('Log In', new_user_session_path, class: 'nav-link')
    end
  end
end
# rubocop:enable Style/GuardClause
# rubocop:enable Layout/LineLength
