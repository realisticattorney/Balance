require 'rails_helper'
# rubocop:disable Layout/LineLength
RSpec.feature 'Following', type: :feature do
  before :each do
    @user = User.create!(fullname: 'german aquila', username: 'german_aquila', email: 'german@gmail.com',
                         password: 'german1', password_confirmation: 'german1', avatar_photo: { io: File.open(Rails.root.join('spec', 'fixtures', 'files', '200x200.jpeg')), filename: '200x200.jpeg', content_type: 'image/jpeg' }, cover_photo: { io: File.open(Rails.root.join('spec', 'fixtures', 'files', '600x200.jpeg')), filename: '600x200.jpeg', content_type: 'image/jpeg' })
    @user2 = User.create!(fullname: 'axel contoli', username: 'axel_contoli', email: 'axel@gmail.com',
                          password: 'axel12', password_confirmation: 'axel12', avatar_photo: { io: File.open(Rails.root.join('spec', 'fixtures', 'files', '200x200.jpeg')), filename: '200x200.jpeg', content_type: 'image/jpeg' }, cover_photo: { io: File.open(Rails.root.join('spec', 'fixtures', 'files', '600x200.jpeg')), filename: '600x200.jpeg', content_type: 'image/jpeg' })
    @user3 = User.create!(fullname: 'facundo cesa', username: 'facundo_cesa', email: 'facundo@gmail.com',
                          password: 'axel12', password_confirmation: 'axel12', avatar_photo: { io: File.open(Rails.root.join('spec', 'fixtures', 'files', '200x200.jpeg')), filename: '200x200.jpeg', content_type: 'image/jpeg' }, cover_photo: { io: File.open(Rails.root.join('spec', 'fixtures', 'files', '600x200.jpeg')), filename: '600x200.jpeg', content_type: 'image/jpeg' })
  end

  context 'Association tests' do
    it 'associates follower and followed' do
      f = Relationship.new(follower_id: @user.id, followed_id: @user2.id)
      expect(f.follower.username).to eql(@user.username)
      expect(f.followed.username).to eql(@user2.username)
    end

    it 'validates following without users to be invalid' do
      f = Relationship.new
      expect(f.valid?).to be_falsy
    end
  end
end
# rubocop:enable Layout/LineLength
