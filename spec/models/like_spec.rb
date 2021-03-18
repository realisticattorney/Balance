
RSpec.describe Like, type: :model do
  before :each do
    @user = User.create!(fullname: "german aquila", username: "german_aquila", email: 'german@gmail.com', password: 'german1', password_confirmation: 'german1', avatar_photo:{io: File.open(Rails.root.join('spec', 'fixtures', 'files', '200x200.jpeg')), filename: '200x200.jpeg', content_type: 'image/jpeg'}, cover_photo:{io: File.open(Rails.root.join('spec', 'fixtures', 'files', '600x200.jpeg')), filename: '600x200.jpeg', content_type: 'image/jpeg'})
    @user2 = User.create!(fullname: "axel contoli", username: "axel_contoli", email: 'axel@gmail.com', password: 'axel12', password_confirmation: 'axel12', avatar_photo:{io: File.open(Rails.root.join('spec', 'fixtures', 'files', '200x200.jpeg')), filename: '200x200.jpeg', content_type: 'image/jpeg'}, cover_photo:{io: File.open(Rails.root.join('spec', 'fixtures', 'files', '600x200.jpeg')), filename: '600x200.jpeg', content_type: 'image/jpeg'})
    @recipe = Recipe.create(user_id: @user.id, description: 'my first recipe')
  end

  context 'Testing associations' do
    it 'belongs to a user' do
      o = Recipe.create(user_id: @user.id, description: 'Recipe one')
      e = Like.new(user_id: @user2.id, recipe_id: o.id)
      expect(e.user_id).to eql(@user2.id)
    end

    it 'belongs to a Recipe' do
      o = Recipe.new(user_id: @user.id, description: 'Recipe one')
      e = Like.new(user_id: @user2.id, recipe_id: o.id)
      expect(e.recipe_id).to eql(o.id)
    end
  end
end