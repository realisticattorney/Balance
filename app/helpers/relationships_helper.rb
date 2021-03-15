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
        button_to 'Follow', relationships_path(followed_id: user.id, follower_id: current_user.id),
                               method: :post, class: 'px-2 bg-blue-300 rounded-lg cursor-pointer'
      else
        button_to 'Unfollow', relationship_path(id: relationship.id, followed_id: user.id),
                               method: :delete, class: 'px-2 bg-blue-300 rounded-lg cursor-pointer' 
 
      end
    end
  end
end
# rubocop:enable Layout/LineLength
# rubocop:enable Style/GuardClause


