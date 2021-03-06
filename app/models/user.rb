class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_commit :add_default_cover, on: %i[create update]
  after_commit :add_default_avatar, on: %i[create update]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :recipes, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :fullname, presence: true, length: { in: 3..25 }
  validates :username, presence: true, length: { in: 3..15 }, uniqueness: true

  has_many :relationships, foreign_key: 'follower_id', dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed

  scope :ordered_by_most_recent, -> { order(created_at: :desc) }

  has_many :reverse_relationships, foreign_key: 'followed_id',
                                   class_name: 'Relationship',
                                   dependent: :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  has_one_attached :avatar_photo
  validates :avatar_photo, attached: false,
                           content_type: ['image/png', 'image/jpg', 'image/jpeg'],
                           size: { less_than: 300.kilobytes, message: 'size should be under 300 kilobytes' }

  has_one_attached :cover_photo
  validates :cover_photo, attached: false,
                          content_type: ['image/png', 'image/jpg', 'image/jpeg'],
                          size: { less_than: 600.kilobytes, message: 'size should be under 600 kilobytes' }

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

  private

  # rubocop:disable Style/GuardClause
  def add_default_cover
    unless cover_photo.attached?
      cover_photo.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'files', '600x200.jpeg')),
                         filename: '600x200.jpeg', content_type: 'image/jpeg')
    end
  end

  def add_default_avatar
    unless avatar_photo.attached?
      avatar_photo.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'files', '200x200.jpeg')),
                          filename: '200x200.jpeg', content_type: 'image/jpeg')
    end
  end
  # rubocop:enable Style/GuardClause
end
