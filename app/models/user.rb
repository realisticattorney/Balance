class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :recipes
  
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy



  def to_s
    email
  end
  

end
