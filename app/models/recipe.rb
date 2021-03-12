class Recipe < ApplicationRecord
  validates :description, presence: true, length: { :minimum => 5 }

  belongs_to :user
  
end
