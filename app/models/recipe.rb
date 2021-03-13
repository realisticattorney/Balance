class Recipe < ApplicationRecord
  validates :description, presence: true, length: { :minimum => 5 }

  belongs_to :user

  extend FriendlyId
  friendly_id :generated_hash, use: :slugged

  def generated_hash
    require 'securerandom'
    @randomslug ||= persisted? ? Friendly_id : SecureRandom.hex(4)
  end

end
