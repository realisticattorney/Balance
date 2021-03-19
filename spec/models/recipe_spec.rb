require 'rails_helper'
# rubocop:disable Layout/LineLength
RSpec.feature 'Recipes', type: :feature do
  before :each do
    @user = User.create!(fullname: 'german aquila', username: 'german_aquila', email: 'german@gmail.com',
                         password: 'german1', password_confirmation: 'german1', avatar_photo: { io: File.open(Rails.root.join('spec', 'fixtures', 'files', '200x200.jpeg')), filename: '200x200.jpeg', content_type: 'image/jpeg' }, cover_photo: { io: File.open(Rails.root.join('spec', 'fixtures', 'files', '600x200.jpeg')), filename: '600x200.jpeg', content_type: 'image/jpeg' })
    @recipe = Recipe.create(user_id: @user.id, description: 'my first recipe')
  end

  context 'Testing validations' do
    it 'assigns the values passed' do
      expect(@recipe.description).to eql('my first recipe')
    end

    it 'validates the object without attributes to be invalid' do
      o = Recipe.create(user_id: @user.id)
      expect(o.valid?).to be_falsy
    end

    it 'validates the object with proper attributes to be valid' do
      o = Recipe.create(user_id: @user.id, description: 'my second recipe')
      expect(o.valid?).to be_truthy
    end

    it 'validates text presence' do
      o = Recipe.new(user: @user, description: ' ')
      expect(o.valid?).to be_falsy
    end

    it 'belongs to a user' do
      o = Recipe.create(user_id: @user.id, description: 'my second recipe')
      expect(o.user.username).to eql(@user.username)
    end
  end
end
# rubocop:enable Layout/LineLength
