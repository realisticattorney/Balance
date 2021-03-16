module ApplicationHelper

  def photo(link)
    link ||= "https://source.unsplash.com/random/1000x200"
  end

  # rubocop:disable Lint/UselessAssignment
  def cover_image(link)
    link ||= "https://source.unsplash.com/random/1000x200"
  end
  # rubocop:enable Lint/UselessAssignment

  def following?(user)
    current_user.following.include?(user)
  end

  def current_user?(user)
    user.id == session[:user_id]
  end

  # def like_or_dislike_btn(talk)
  #   like = Like.find_by(talk: talk, user: current_user)
  #   if like
  #     link_to('Dislike', talk_like_path(id: like.id, talk_id: talk.id), method: :delete)
  #   else
  #     link_to('Like', talk_likes_path(talk_id: talk.id), method: :post)
  #   end
  # end
end
