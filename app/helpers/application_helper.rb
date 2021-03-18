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




def feed(recipe, user)
  out = ''
  unless user.recipes.empty?
    out << ".row.bg-white.mr-5.py-4.mt-2
    .col-1
      = #{image_tag recipe.user.avatar_photo, height: "50px", width: "50px"}
    .col-9.ml-2
      .row
        %h6
          = #{link_to recipe.user.fullname, user_path(recipe.user)}
          %small
            = #{link_to "@" + recipe.user.username, user_path(recipe.user)}
      .row
        %p= #{recipe.description}"
  end
  out.html_safe
end



def feed(recipe, user)
  if user.recipes.empty?
    return "%h3 No predictions available yet".html_safe
  else  
    render 'users/feed', user: user, recipe: recipe
  end
end

def authorized_edit?(recipe)
  if policy(recipe).edit?
    link_to('Destroy', recipe, method: :delete, data: { confirm: 'Are you sure?' }, class: 'btn btn-twitter align-self-center')
  end
end

end
