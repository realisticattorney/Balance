class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  
  has_many :recipes, dependent: :destroy
  
  validates :fullname, presence: true, length: { in: 3..25 }
  validates :username, presence: true, length: { in: 3..15 }, uniqueness: true
  
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  
  
  has_many :reverse_relationships, foreign_key: "followed_id",
  class_name:  "Relationship",
  dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower
  
  has_one_attached :avatar_photo
  validates :avatar_photo, attached: true, 
    content_type: ['image/png', 'image/jpg', 'image/jpeg'], 
    size: { less_than: 300.kilobytes , message: 'size should be under 300 kilobytes' }
  
  has_one_attached :cover_photo
  validates :cover_photo, attached: true, 
    content_type: ['image/png', 'image/jpg', 'image/jpeg'], 
    size: { less_than: 600.kilobytes , message: 'size should be under 600 kilobytes' }

  def following?(other_user)
    relationships.find_by_followed_id(other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by_followed_id(other_user.id).destroy
  end


  def to_s
    email
  end
  
  include Gravtastic
  gravtastic


end
