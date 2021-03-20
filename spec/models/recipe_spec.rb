require 'rails_helper'
# rubocop:disable Layout/LineLength
RSpec.feature 'Recipes', type: :feature do
  before :each do
    @user = User.create!(fullname: 'german aquila', username: 'german_aquila', email: 'german@gmail.com',
                         password: 'german1', password_confirmation: 'german1', avatar_photo: { io: File.open(Rails.root.join('spec', 'fixtures', 'files', '200x200.jpeg')), filename: '200x200.jpeg', content_type: 'image/jpeg' }, cover_photo: { io: File.open(Rails.root.join('spec', 'fixtures', 'files', '600x200.jpeg')), filename: '600x200.jpeg', content_type: 'image/jpeg' })
  end
  context 'Initiating object' do
    it 'creates a new object' do
      o = Recipe.new
      expect(o).to be_a(Object)
    end

    it 'assigns the values passed' do
      o = Recipe.new({ description: 'Recipe one' })
      expect(o.description).to eql('Recipe one')
    end
  end

  context 'Testing validations' do
    it 'validates the object without attributes to be invalid' do
      o = Recipe.new
      expect(o.valid?).to be_falsy
    end

    it 'validates the object with proper attributes to be valid' do
      o = Recipe.new(user_id: @user.id, description: 'Recipe one')
      expect(o.valid?).to be_truthy
    end

    it 'validates text presence' do
      o = Recipe.new(user_id: @user.id, description: ' ')
      expect(o.valid?).to be_falsy
    end
  end
end
# rubocop:enable Layout/LineLength
