# rubocop:disable Layout/LineLength
# rubocop:disable Style/GuardClause
module RelationshipsHelper
  def verify_relationship(followed_id)
    Relationship.where('(follower_id = ? and followed_id = ?) OR (follower_id = ? and followed_id = ?)',
                     current_user.id, followed_id, followed_id, current_user.id).first
  end

  def relationship_button(user, current_user)
    relationship = verify_relationship(user)
    if current_user != user
      if relationship.nil?
        content_tag(:div,
                    (button_to 'Follow',
                               relationships_path(followed_id: user.id, follower_id: current_user.id),
                               method: :post, class: 'button-relationship'))
      else
        content_tag(:div,
                    (button_to 'Unfollow',
                               relationship_path(id: relationship.id, followed_id: user.id),
                               method: :delete, class: 'button-relationship'))
 
      end
    end
  end
end
# rubocop:enable Layout/LineLength
# rubocop:enable Style/GuardClause


